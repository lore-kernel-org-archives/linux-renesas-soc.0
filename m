Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:59092 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727530AbeHHXIJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 Aug 2018 19:08:09 -0400
From: Chris Brandt <Chris.Brandt@renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
CC: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        "uli@fpond.eu" <uli@fpond.eu>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Greg KH <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>
Subject: RE: [PATCH/RFC 0/4] sh-sci : Do not derive regshift from regsize
Date: Wed, 8 Aug 2018 20:46:37 +0000
Message-ID: <TY1PR01MB1562E090B9BE06CC2EE5BDD58A260@TY1PR01MB1562.jpnprd01.prod.outlook.com>
References: <20180806140755.24087-1-geert+renesas@glider.be>
 <CAMuHMdX1bbOhtpVrjNC5hAAR8y_+f9eM1STigxMhWUZEdkJzZg@mail.gmail.com>
In-Reply-To: <CAMuHMdX1bbOhtpVrjNC5hAAR8y_+f9eM1STigxMhWUZEdkJzZg@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

SGkgR2VlcnQsDQoNCkp1c3QgRllJLi4uDQoNCk9uIFdlZG5lc2RheSwgQXVndXN0IDA4LCAyMDE4
LCBHZWVydCBVeXR0ZXJob2V2ZW4gd3JvdGU6DQo+ICAgNC4gRHJvcCAicmVuZXNhcyxzY2lmIiBm
cm9tIHRoZSBjb21wYXRpYmxlIHZhbHVlIGluIHRoZSAobm90IHlldA0KPiAgICAgIHN1Ym1pdHRl
ZCkgcjdzOTIxMC5kdHNpICh0aGlzIG1heSBoYXZlIHRvIGJlIGNsYXJpZmllZCBpbiB0aGUgRFQN
Cj4gICAgICBiaW5kaW5ncywgYWx0aG91Z2ggdGhleSBhbHJlYWR5IHNheSAicmVuZXNhcyxzY2lm
IiBpcyBvbmx5IG1lYW50IGZvcg0KPiAgICAgIHBvcnRzIGNvbXBhdGlibGUgd2l0aCB0aGUgZ2Vu
ZXJpYyB2ZXJzaW9uLCB3aGF0ZXZlciB0aGF0IG1lYW5zIDstKSwNCg0KSnVzdCBhcyB5b3Ugd291
bGQgZXhwZWN0LCBpZiBJIGRyb3AgInJlbmVzYXMsc2NpZiIgZnJvbSByN3M5MjEwLmR0c2ksIA0K
dGhlbiBlYXJseWNvbiB3b3JrcyB3aXRoIHlvdXIgUkZDIHBhdGNoZXMgc2luY2Ugbm93IHRoZXJl
IGlzIG9ubHkgb25lDQpjb21wYXRpYmxlIGl0IGNhbiBwb3NzaWJseSBtYXRjaCBhZ2FpbnN0Lg0K
DQoNCkNocmlzDQo=
