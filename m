Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:12785 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1756228AbeAHL76 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Jan 2018 06:59:58 -0500
From: Chris Brandt <Chris.Brandt@renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
        Simon Horman <horms@verge.net.au>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        USB list <linux-usb@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: RE: [PATCH v3 0/3] usb: renesas_usbhs: Add RZ/A1 support
Date: Mon, 8 Jan 2018 11:59:51 +0000
Message-ID: <SG2PR06MB1165E6B9D4C00EE2A98E8E348A130@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <20180105224647.42262-1-chris.brandt@renesas.com>
 <CAMuHMdV+1Y+OozRa0P2MJZQ-rT+ZfmW4iy2AYya1EMgrjb+y8Q@mail.gmail.com>
In-Reply-To: <CAMuHMdV+1Y+OozRa0P2MJZQ-rT+ZfmW4iy2AYya1EMgrjb+y8Q@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

SGkgR2VlcnQgYW5kIFNpbW9uLA0KDQoNCk9uIE1vbmRheSwgSmFudWFyeSAwOCwgMjAxOCwgR2Vl
cnQgVXl0dGVyaG9ldmVuIHdyb3RlOg0KPiBUaGFua3MgZm9yIHRoZSB1cGRhdGUsIGJ1dCBJIHRo
aW5rIHRoZXJlIGhhcyBiZWVuIGEgbWlzdW5kZXJzdGFuZGluZy4NCj4gSSBkaWRuJ3QgbWVhbiB0
byBkcm9wICJyZW5lc2FzLHVzYmhzLXI3czcyMTAwIiBldmVyeXdoZXJlLCBvbmx5IGZyb20NCj4g
dGhlIG1hdGNoaW5nIGluIHRoZSBkcml2ZXIuDQoNCg0KT3BwcywgSSB3YXMgYWxsIGtpbmRzIG9m
IGNvbmZ1c2VkIHRoZW4uDQoNCg0KU28sIGJlZm9yZSBJIHN1Ym1pdCBhIFY0LCBoZXJlIGlzIG15
IHVuZGVyc3RhbmRpbmc6DQoNCg0KZHJpdmVycy8uLi4vY29tbW9uLmMNCiAqIGNvbnRhaW5zIC1v
bmx5LSAgJy5jb21wYXRpYmxlID0gInJlbmVzYXMscnphMS11c2JocyInDQogDQoNCkRvY3VtZW50
YXRpb24vLi4uL3JlbmVzYXNfdXNiaHMudHh0DQogKiBjb250YWlucyBib3RoICJyZW5lc2FzLHVz
YmhzLXI3czcyMTAwIiBhbmQgInJlbmVzYXMscnphMS11c2JocyINCg0KDQpyN3M3MjEwMC5kdHNp
DQoqIHVzYmhzMDogdXNiQGU4MDEwMDAwIHsNCiAgICBjb21wYXRpYmxlID0gInJlbmVzYXMsdXNi
aHMtcjdzNzIxMDAiLCAicmVuZXNhcyxyemExLXVzYmhzIjsNCg0KDQpJcyB0aGlzIGNvcnJlY3Q/
DQoNClRoYW5rcywNCkNocmlzDQo=
