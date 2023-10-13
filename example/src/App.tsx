/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 */

import React from 'react';
import {
  StyleSheet,
  View,
  Button,
} from 'react-native';

import {
  loadGame,
} from 'react-native-omantel_library_sample';



export default function App() {
  return (
    <View style={styles.container}>
      <Button title='Load Spin and Win' onPress={() => { loadGame() }} />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
  box: {
    width: 60,
    height: 60,
    marginVertical: 20,
  },
});

