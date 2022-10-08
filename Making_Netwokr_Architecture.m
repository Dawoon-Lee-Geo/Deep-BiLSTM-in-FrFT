clear all; close all; clc;
Input_feature=51;
Output_feature=1;

layers = [
    sequenceInputLayer(Input_feature,"Name","sequenceinput")
    bilstmLayer(128,"Name","biLSTM_1")
    dropoutLayer(0.2,"Name","dropout_1")
    bilstmLayer(128,"Name","biLSTM_2")
    dropoutLayer(0.2,"Name","dropout_2")
    bilstmLayer(64,"Name","biLSTM_3")
    dropoutLayer(0.2,"Name","dropout_3")
    bilstmLayer(64,"Name","biLSTM_4")
    fullyConnectedLayer(Output_feature,"Name","fc")
    regressionLayer("Name","regressionoutput")];
