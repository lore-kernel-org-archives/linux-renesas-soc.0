Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:23128 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1731119AbeGaMPd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 31 Jul 2018 08:15:33 -0400
From: Chris Brandt <Chris.Brandt@renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Greg KH <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: RE: [PATCH v2 4/4] serial: sh-sci: Improve support for separate TEI
 and DRI interrupts
Date: Tue, 31 Jul 2018 10:35:47 +0000
Message-ID: <TY1PR01MB1562618259010A30E0E8F41D8A2E0@TY1PR01MB1562.jpnprd01.prod.outlook.com>
References: <20180730131716.75484-1-chris.brandt@renesas.com>
 <20180730131716.75484-5-chris.brandt@renesas.com>
 <CAMuHMdWfftK00Qndu3sxGgRnKcrU29Z_oAUK2e+kC25mu8bA3g@mail.gmail.com>
In-Reply-To: <CAMuHMdWfftK00Qndu3sxGgRnKcrU29Z_oAUK2e+kC25mu8bA3g@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

SGkgR2VlcnQsDQoNCkFzIGFsd2F5cywgdGhhbmsgeW91IGZvciB5b3VyIHJldmlldy4NCg0KT24g
VHVlc2RheSwgSnVseSAzMSwgMjAxOCwgR2VlcnQgVXl0dGVyaG9ldmVuIHdyb3RlOg0KPiA+IEBA
IC0xODQ1LDMxICsxODU4LDggQEAgc3RhdGljIGludCBzY2lfcmVxdWVzdF9pcnEoc3RydWN0IHNj
aV9wb3J0ICpwb3J0KQ0KPiA+DQo+ID4gICAgICAgICAgICAgICAgIGRlc2MgPSBzY2lfaXJxX2Rl
c2MgKyBpOw0KPiA+ICAgICAgICAgICAgICAgICBwb3J0LT5pcnFzdHJbal0gPSBOVUxMOw0KPiAN
Cj4gVGhlIGFib3ZlIGxpbmUgY2FuIGJlIHJlbW92ZWQgYWdhaW4sIHRvby4NCg0KDQpHb29kIHBv
aW50LiBUaGFuayB5b3UuDQoNCkkgd2lsbCB1cGRhdGUgaXQgbm93Lg0KDQpDaHJpcw0KDQo=
