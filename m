Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-eopbgr1410137.outbound.protection.outlook.com ([40.107.141.137]:26391
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726607AbeLJPfr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Dec 2018 10:35:47 -0500
From: Biju Das <biju.das@bp.renesas.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v4 1/5] nvmem: check invalid number of bytes in
 nvmem_device_{read,write}
Date: Mon, 10 Dec 2018 15:35:38 +0000
Message-ID: <OSBPR01MB2103060BAFB268FDB1C9FF1EB8A50@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1544182066-31528-1-git-send-email-biju.das@bp.renesas.com>
 <1544182066-31528-2-git-send-email-biju.das@bp.renesas.com>
 <3c09d148-7102-1ee5-770a-009e40de6168@linaro.org>
 <OSBPR01MB21034A6FB7EF6E877DA0F151B8A50@OSBPR01MB2103.jpnprd01.prod.outlook.com>
 <e6643627-e6f3-5dad-9c3f-6babb8e0ce56@linaro.org>
In-Reply-To: <e6643627-e6f3-5dad-9c3f-6babb8e0ce56@linaro.org>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

SGkgU3Jpbml2YXMsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJl
OiBbUEFUQ0ggdjQgMS81XSBudm1lbTogY2hlY2sgaW52YWxpZCBudW1iZXIgb2YgYnl0ZXMgaW4N
Cj4gbnZtZW1fZGV2aWNlX3tyZWFkLHdyaXRlfQ0KPg0KPg0KPg0KPiBPbiAxMC8xMi8xOCAxMjo0
NSwgQmlqdSBEYXMgd3JvdGU6DQo+ID4+IEl0cyBiZXR0ZXIgdG8gbW92ZSBjaGVja3MgZnJvbQ0K
PiA+PiBiaW5fYXR0cl9udm1lbV9yZWFkKCkvYmluX2F0dHJfbnZtZW1fd3JpdGUoKSBpbnRvDQo+
IG52bWVtX3JlZ19yZWFkKCkNCj4gPj4gYW5kIG52bWVtX3JlZ193cml0ZSgpLCBzbyBpdHMgZWFz
eSB0byBtYWludGFpbiwgcmF0aGVyIHRoYW4gYWRkaW5nDQo+ID4+IHRoZW0gdG8gZWFjaCBmdW5j
dGlvbi4NCj4gPiBJbml0aWFsbHkgSSBhbHNvIHRob3VnaHQgdGhlIHNhbWUuIEJ1dCB0aGVyZSBh
cmUgc29tZSBSVEMgZHJpdmVycw0KPiA+IHdoaWNoIGlzIHVzaW5nIG52bWVtX2RldmljZSBpbnRl
cmZhY2UgIGlzIG5vdCBkZWZpbmluZyAid29yZF9zaXplIg0KPiBtZW1iZXIuIFRoYXQgaXMgdGhl
IHJlYXNvbiB3ZSBuZWVkIHRvIGFkZCBpdCBpbiBzZXBhcmF0ZSBmdW5jdGlvbi4NCj4gPiBDYW4g
eW91IHBsZWFzZSBzdWdnZXN0IGhvdyB0byBoYW5kbGUgdGhlIGFib3ZlIGRyaXZlcnM/DQo+DQo+
IFdvcmQgc2l6ZSBpcyBvcHRpb25hbCBhbnl3YXksIGluIHRoZSBjYXNlIHdoZXJlIHdvcmRfc2l6
ZSBpcyBub3Qgc3BlY2lmaWVkLA0KPiBpdHMgY29uc2lkZXJlZCBhcyBvbmUgYnl0ZSB3b3JkX3Np
emUuDQoNCldpbGwgc2VuZCBWMiBmb3IgdGhpcy4NCg0KUmVnYXJkcywNCkJpanUNCg0KDQpbaHR0
cHM6Ly93d3cyLnJlbmVzYXMuZXUvbWVkaWEvZW1haWwvdW5pY2VmLmpwZ10NCg0KVGhpcyBDaHJp
c3RtYXMsIGluc3RlYWQgb2Ygc2VuZGluZyBvdXQgY2FyZHMsIFJlbmVzYXMgRWxlY3Ryb25pY3Mg
RXVyb3BlIGhhdmUgZGVjaWRlZCB0byBzdXBwb3J0IFVuaWNlZiB3aXRoIGEgZG9uYXRpb24uIEZv
ciBmdXJ0aGVyIGRldGFpbHMgY2xpY2sgaGVyZTxodHRwczovL3d3dy51bmljZWYub3JnLz4gdG8g
ZmluZCBvdXQgYWJvdXQgdGhlIHZhbHVhYmxlIHdvcmsgdGhleSBkbywgaGVscGluZyBjaGlsZHJl
biBhbGwgb3ZlciB0aGUgd29ybGQuDQpXZSB3b3VsZCBsaWtlIHRvIHRha2UgdGhpcyBvcHBvcnR1
bml0eSB0byB3aXNoIHlvdSBhIE1lcnJ5IENocmlzdG1hcyBhbmQgYSBwcm9zcGVyb3VzIE5ldyBZ
ZWFyLg0KDQoNCg0KUmVuZXNhcyBFbGVjdHJvbmljcyBFdXJvcGUgTHRkLCBEdWtlcyBNZWFkb3cs
IE1pbGxib2FyZCBSb2FkLCBCb3VybmUgRW5kLCBCdWNraW5naGFtc2hpcmUsIFNMOCA1RkgsIFVL
LiBSZWdpc3RlcmVkIGluIEVuZ2xhbmQgJiBXYWxlcyB1bmRlciBSZWdpc3RlcmVkIE5vLiAwNDU4
NjcwOS4NCg==
