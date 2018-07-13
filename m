Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:19869 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727434AbeGMMEl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Jul 2018 08:04:41 -0400
From: Chris Brandt <Chris.Brandt@renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>
Subject: RE: [PATCH 2/2] dt-bindings: arm: Document RZ/A2 SoC DT bindings
Date: Fri, 13 Jul 2018 11:50:16 +0000
Message-ID: <TY1PR01MB1562A3B909AFC6CEB7E5BD088A580@TY1PR01MB1562.jpnprd01.prod.outlook.com>
References: <20180712030149.91385-1-chris.brandt@renesas.com>
 <20180712030149.91385-3-chris.brandt@renesas.com>
 <CAMuHMdXuXJdvtmEu3WYVSgwd0xfCpQcWQeL+FA9vUMxiA7h=VQ@mail.gmail.com>
 <TY1PR01MB15621B11047F645DE25485E68A590@TY1PR01MB1562.jpnprd01.prod.outlook.com>
 <CAMuHMdWRprU3jhFUnAzExFZYemqA7Hbvr-ritx0K662Rmy2ieQ@mail.gmail.com>
In-Reply-To: <CAMuHMdWRprU3jhFUnAzExFZYemqA7Hbvr-ritx0K662Rmy2ieQ@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

SGkgR2VlcnQsDQoNCk9uIFRodXJzZGF5LCBKdWx5IDEyLCAyMDE4LCBHZWVydCBVeXR0ZXJob2V2
ZW4gd3JvdGU6DQo+IEFzIHRoZSBJUCBjb3JlcyBhcmUgdGhlIHNhbWUgaW4gYWxsIHZhcmlhbnRz
LCB1c2luZw0KPiAicmVuZXNhcyxyN3M5MjEwLTxzb21ldGhpbmc+IiBzaG91bGQgYmUgZmluZSBm
b3IgbWF0Y2hpbmcgZHJpdmVycyB0byBJUA0KPiBjb3Jlcy4gU2FtZSBmb3IgQ09ORklHX0FSQ0hf
UjdTOTIxMC4NCj4gDQo+IEhvd2V2ZXIsIGFzIHRoZSBhY3R1YWwgZGllcyBkaWZmZXIgYmV0d2Vl
biBILCBNLCBhbmQgTCB2ZXJzaW9ucywgdGhlcmUgbWF5DQo+IGJlIGludGVncmF0aW9uIGlzc3Vl
cyB0byBiZSB3b3JrZWQgYXJvdW5kLiBTbyBJIHRoaW5rIGl0IHdvdWxkIGJlIHdpc2UgdG8NCj4g
dXNlIG9uZSBtb3JlIGRpZ2l0IGluIHRoZSBjb21wYXRpYmxlIHZhbHVlIGF0IHRoZSBtYWluIFNv
QyBsZXZlbCwgaS5lLg0KPiAicmVuZXNhcyxyN3M5MjEwNCIuDQo+IFVubGVzcyB0aGVyZSdzIGEg
aGFyZHdhcmUgcmVnaXN0ZXIgdG8gZGV0ZWN0IHRoZSB2ZXJzaW9uIGF0IHJ1bnRpbWUuDQo+IEJ1
dCBpdCBzZWVtcyBSWi9BMiBkb2Vzbid0IGhhdmUgYSBQcm9kdWN0IFJlZ2lzdGVyDQo+IChQUlIp
LCB3aGljaCBtb3N0IG90aGVyIFNIL1ItTW9iaWxlIGFuZCBSLUNhciBTb0NzIGRvIGhhdmU/DQoN
Cg0KVGhlcmUgaXMgYW4gSUQgcmVnaXN0ZXIgaW4gUlovQTIgdGhhdCB3aWxsIGhhdmUgYSBkaWZm
ZXJlbnQgbnVtYmVyIGZvciANCmVhY2ggc2lsaWNvbi4NClNlZSB0aGUgZmlyc3QgZW50cnkgaW4g
VGFibGUgNS42IChCU0lEIHJlZ2lzdGVyKS4NCg0KVGVjaG5pY2FsbHksIGl0J3Mgbm90ICAiUFJS
IiBsaWtlIGl0J3MgU0gvUi1DYXIgZGV2aWNlcy4gSXQncyBhY3R1YWxseSANCnRoZSBib3VuZGFy
eSBzY2FuIElEIG51bWJlci4gQWxsIFJaL0ExIGRldmljZXMgaGF2ZSB0aGlzIHRvby4gQnV0IHdp
dGggDQpSWi9BMSwgeW91IGNvdWxkIG9ubHkgZ2V0IHRvIHRoaXMgcmVnaXN0ZXIgdGhyb3VnaCBK
VEFHIChub3QgYnkgdGhlIENQVSkuIA0KU28gZm9yIFJaL0EyKywgdGhleSB3aWxsIG1pcnJvciB0
aGF0IHJlZ2lzdGVyIHRvIENQVSBzcGFjZS4NCg0KU28gd2l0aCB0aGF0IHNhaWQsIGFyZSB3ZSBn
b29kIHdpdGggQ09ORklHX0FSQ0hfUjdTOTIxMD8NCg0KQ2hyaXMNCg0K
