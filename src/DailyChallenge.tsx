import { View, Text, Animated, Easing, TouchableOpacity, Image } from 'react-native';
import { NativeModules } from 'react-native';
import * as React from 'react';

const DailyChallenge = (props: { onSpinClick?: Function, onLuckyClick?: Function, onShakeClick?: Function }) => {
    let rotateValueHolder = new Animated.Value(0);


    rotateValueHolder.setValue(0);
    Animated.loop(
        Animated.timing(rotateValueHolder, {
            toValue: 1,
            duration: 90000,
            easing: Easing.linear,
            useNativeDriver: true,
        })
    ).start();


    const RotateData = rotateValueHolder.interpolate({
        inputRange: [0, 1],
        outputRange: ['0deg', '360deg'],
    });


    return <View style={{ flexDirection: 'row', height: 250, paddingVertical: 10, width: '90%', }}>
        <View style={{ backgroundColor: '#3C82C5', borderRadius: 10, flex: 1, flexDirection: 'column-reverse', marginEnd: 10, paddingStart: 10, overflow: 'hidden' }}>
            <Animated.Image
                source={require('../src/assets/wheel_home.png')}
                style={{ end: -50, height: 180, position: 'absolute', top: -50, transform: [{ rotate: RotateData }], width: 180, }} />
            <TouchableOpacity
                onPress={() => props.onSpinClick == null ? NativeModules.OmantelLibrarySample.loadGame() : props.onSpinClick()}
            >
                <Text style={{ backgroundColor: 'white', borderRadius: 50, color: 'black', fontSize: 12, fontWeight: '500', flexWrap: 'wrap', marginBottom: 10, marginTop: 10, padding: 5, textAlign: 'center', width: '50%' }}>Play Now</Text>
            </TouchableOpacity>
            <Text style={{ color: 'white', fontSize: 20, fontWeight: '500' }}>Spin & Win</Text>

        </View>

        <View style={{ flex: 1 }}>
            <TouchableOpacity style={{ flex: 1, }}
                onPress={() => props.onLuckyClick && props.onLuckyClick()}
            >
                <View style={{ backgroundColor: "#3C82C5", borderRadius: 10, flex: 1, marginBottom: 5, paddingStart: 10, paddingTop: 10 }}>
                    <Text style={{ color: 'white', fontSize: 18, fontWeight: '500' }}>Lucky Lottery</Text>
                    <Text style={{ color: 'white', fontSize: 14, fontWeight: '400' }}>150 Points</Text>
                    <Image style={{ bottom: 5, end: 5, height: 60, opacity: 0.5, position: 'absolute', width: 60 }} source={require('../src/assets/ic_dice.png')} />
                </View>
            </TouchableOpacity>

            <TouchableOpacity style={{ flex: 1, }}
                onPress={() => props.onShakeClick && props.onShakeClick()}
            >
                <View style={{ backgroundColor: "#66C9CB", borderRadius: 10, flex: 1, marginTop: 5, paddingStart: 10, paddingTop: 10 }}>
                    <Text style={{ color: 'white', fontSize: 18, fontWeight: '500' }}>Shake & Win</Text>
                    <Text style={{ color: 'white', fontSize: 14, fontWeight: '400' }}>100 Points</Text>
                    <Image style={{ bottom: 5, end: 5, height: 60, opacity: 0.8, position: 'absolute', width: 60 }} source={require('../src/assets/ic_shake_win.png')} />
                </View>
            </TouchableOpacity>

        </View>
    </View>
}

export default DailyChallenge
