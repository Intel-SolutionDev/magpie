#!/bin/bash

source test-common.sh
source test-config.sh

SubmitMahoutStandardTests_ClusterSyntheticcontrol() {
    local mahoutversion=$1
    local hadoopversion=$2

    BasicJobSubmit magpie.${submissiontype}-hadoop-and-mahout-hadoop-${hadoopversion}-mahout-${mahoutversion}-run-clustersyntheticcontrol
	    
    BasicJobSubmit magpie.${submissiontype}-hadoop-and-mahout-hadoop-${hadoopversion}-mahout-${mahoutversion}-run-clustersyntheticcontrol-no-local-dir
}

SubmitMahoutStandardTests() {
    for testfunction in SubmitMahoutStandardTests_ClusterSyntheticcontrol
    do
	for mahoutversion in ${mahouthadoop27java17versions}
	do
	    ${testfunction} ${mahoutversion} ${mahouthadoop27java17versions_hadoopversion}
	done
    done
}

SubmitMahoutDependencyTests_Dependency1() {
    local mahoutversion=$1
    local hadoopversion=$2

    BasicJobSubmit magpie.${submissiontype}-hadoop-and-mahout-DependencyMahout1A-hadoop-${hadoopversion}-mahout-${mahoutversion}-hdfsoverlustre-run-clustersyntheticcontrol
    DependentJobSubmit magpie.${submissiontype}-hadoop-and-mahout-DependencyMahout1A-hadoop-${hadoopversion}-mahout-${mahoutversion}-hdfsoverlustre-run-clustersyntheticcontrol

    BasicJobSubmit magpie.${submissiontype}-hadoop-and-mahout-DependencyMahout1A-hadoop-${hadoopversion}-mahout-${mahoutversion}-hdfsovernetworkfs-run-clustersyntheticcontrol
    DependentJobSubmit magpie.${submissiontype}-hadoop-and-mahout-DependencyMahout1A-hadoop-${hadoopversion}-mahout-${mahoutversion}-hdfsovernetworkfs-run-clustersyntheticcontrol
}

SubmitMahoutDependencyTests() {
    for testfunction in SubmitMahoutDependencyTests_Dependency1
    do
	for mahoutversion in ${mahouthadoop27java17versions}
	do
	    ${testfunction} ${mahoutversion} ${mahouthadoop27java17versions_hadoopversion}
	done
    done
}