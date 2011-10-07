// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.springsource.petclinic.domain;

import com.springsource.petclinic.domain.VetDataOnDemand;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect VetIntegrationTest_Roo_IntegrationTest {
    
    declare @type: VetIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: VetIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext.xml");
    
    declare @type: VetIntegrationTest: @Transactional;
    
    @Autowired
    private VetDataOnDemand VetIntegrationTest.dod;
    
    @Test
    public void VetIntegrationTest.testCountVets() {
        org.junit.Assert.assertNotNull("Data on demand for 'Vet' failed to initialize correctly", dod.getRandomVet());
        long count = com.springsource.petclinic.domain.Vet.countVets();
        org.junit.Assert.assertTrue("Counter for 'Vet' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void VetIntegrationTest.testFindVet() {
        com.springsource.petclinic.domain.Vet obj = dod.getRandomVet();
        org.junit.Assert.assertNotNull("Data on demand for 'Vet' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Vet' failed to provide an identifier", id);
        obj = com.springsource.petclinic.domain.Vet.findVet(id);
        org.junit.Assert.assertNotNull("Find method for 'Vet' illegally returned null for id '" + id + "'", obj);
        org.junit.Assert.assertEquals("Find method for 'Vet' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void VetIntegrationTest.testFindAllVets() {
        org.junit.Assert.assertNotNull("Data on demand for 'Vet' failed to initialize correctly", dod.getRandomVet());
        long count = com.springsource.petclinic.domain.Vet.countVets();
        org.junit.Assert.assertTrue("Too expensive to perform a find all test for 'Vet', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        java.util.List<com.springsource.petclinic.domain.Vet> result = com.springsource.petclinic.domain.Vet.findAllVets();
        org.junit.Assert.assertNotNull("Find all method for 'Vet' illegally returned null", result);
        org.junit.Assert.assertTrue("Find all method for 'Vet' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void VetIntegrationTest.testFindVetEntries() {
        org.junit.Assert.assertNotNull("Data on demand for 'Vet' failed to initialize correctly", dod.getRandomVet());
        long count = com.springsource.petclinic.domain.Vet.countVets();
        if (count > 20) count = 20;
        java.util.List<com.springsource.petclinic.domain.Vet> result = com.springsource.petclinic.domain.Vet.findVetEntries(0, (int) count);
        org.junit.Assert.assertNotNull("Find entries method for 'Vet' illegally returned null", result);
        org.junit.Assert.assertEquals("Find entries method for 'Vet' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void VetIntegrationTest.testFlush() {
        com.springsource.petclinic.domain.Vet obj = dod.getRandomVet();
        org.junit.Assert.assertNotNull("Data on demand for 'Vet' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Vet' failed to provide an identifier", id);
        obj = com.springsource.petclinic.domain.Vet.findVet(id);
        org.junit.Assert.assertNotNull("Find method for 'Vet' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyVet(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'Vet' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void VetIntegrationTest.testMerge() {
        com.springsource.petclinic.domain.Vet obj = dod.getRandomVet();
        org.junit.Assert.assertNotNull("Data on demand for 'Vet' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Vet' failed to provide an identifier", id);
        obj = com.springsource.petclinic.domain.Vet.findVet(id);
        boolean modified =  dod.modifyVet(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        com.springsource.petclinic.domain.Vet merged = (com.springsource.petclinic.domain.Vet) obj.merge();
        obj.flush();
        org.junit.Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        org.junit.Assert.assertTrue("Version for 'Vet' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void VetIntegrationTest.testPersist() {
        org.junit.Assert.assertNotNull("Data on demand for 'Vet' failed to initialize correctly", dod.getRandomVet());
        com.springsource.petclinic.domain.Vet obj = dod.getNewTransientVet(Integer.MAX_VALUE);
        org.junit.Assert.assertNotNull("Data on demand for 'Vet' failed to provide a new transient entity", obj);
        org.junit.Assert.assertNull("Expected 'Vet' identifier to be null", obj.getId());
        obj.persist();
        obj.flush();
        org.junit.Assert.assertNotNull("Expected 'Vet' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void VetIntegrationTest.testRemove() {
        com.springsource.petclinic.domain.Vet obj = dod.getRandomVet();
        org.junit.Assert.assertNotNull("Data on demand for 'Vet' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Vet' failed to provide an identifier", id);
        obj = com.springsource.petclinic.domain.Vet.findVet(id);
        obj.remove();
        obj.flush();
        org.junit.Assert.assertNull("Failed to remove 'Vet' with identifier '" + id + "'", com.springsource.petclinic.domain.Vet.findVet(id));
    }
    
}