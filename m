Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:52944 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726744AbeHHNv6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 Aug 2018 09:51:58 -0400
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
Date: Wed, 8 Aug 2018 11:32:37 +0000
Message-ID: <TY1PR01MB1562D62F0BCC556336ECECFE8A260@TY1PR01MB1562.jpnprd01.prod.outlook.com>
References: <20180806140755.24087-1-geert+renesas@glider.be>
 <CAMuHMdX1bbOhtpVrjNC5hAAR8y_+f9eM1STigxMhWUZEdkJzZg@mail.gmail.com>
In-Reply-To: <CAMuHMdX1bbOhtpVrjNC5hAAR8y_+f9eM1STigxMhWUZEdkJzZg@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

SGkgR2VlcnQsDQoNCk9uIFdlZG5lc2RheSwgQXVndXN0IDA4LCAyMDE4LCBHZWVydCBVeXR0ZXJo
b2V2ZW4gd3JvdGU6DQo+IFN1Z2dlc3Rpb25zIGZvciBhY3Rpb25zOg0KPiAgIDEuIFJldmVydCBj
b21taXQgN2FjZWNlNzFhNTE3Y2FkOCAoInNlcmlhbDogc2gtc2NpOiBSZW1vdmUNCj4gICAgICBT
Q0l4X1JaX1NDSUZBX1JFR1RZUEUiKSwgYXMgdGhpcyBpcyBhIGRlcGVuZGVuY3kgZm9yIHN0ZXAg
MiwNCj4gICAyLiBSZXZlcnQgY29tbWl0IDJkNGRkMGRhNDU0MDFjN2EgKCJzZXJpYWw6IHNoLXNj
aTogQWxsb3cgZm9yIGNvbXByZXNzZWQNCj4gICAgICBTQ0lGIGFkZHJlc3MiKSwgdG8gdW5icmVh
ayBlYXJseWNvbiBvbiBSWi9BMSwgUlovRywgYW5kIFItQ2FyIFNDSUYNCj4gICAgICBwb3J0cywN
Cg0KT2ggd2VsbC4gVGhlIGlkZWEgb2YgYSBzaGFyZWQgU0NJRiByZWd0eXBlIHdhcyBhIGdvb2Qg
aWRlYS4uLmp1c3QgdG9vIA0KbXVjaCBiYWdnYWdlIHRvIGRlYWwgd2l0aC4NCg0KDQo+ICAgNC4g
RHJvcCAicmVuZXNhcyxzY2lmIiBmcm9tIHRoZSBjb21wYXRpYmxlIHZhbHVlIGluIHRoZSAobm90
IHlldA0KPiAgICAgIHN1Ym1pdHRlZCkgcjdzOTIxMC5kdHNpICh0aGlzIG1heSBoYXZlIHRvIGJl
IGNsYXJpZmllZCBpbiB0aGUgRFQNCj4gICAgICBiaW5kaW5ncywgYWx0aG91Z2ggdGhleSBhbHJl
YWR5IHNheSAicmVuZXNhcyxzY2lmIiBpcyBvbmx5IG1lYW50IGZvcg0KPiAgICAgIHBvcnRzIGNv
bXBhdGlibGUgd2l0aCB0aGUgZ2VuZXJpYyB2ZXJzaW9uLCB3aGF0ZXZlciB0aGF0IG1lYW5zIDst
KSwNCg0KQXMgc29vbiBhcyBJIHVwZGF0ZSB0byB0aGUgbmV3IGNsb2NrIGRyaXZlciBzdHlsZSBh
bmQgZ2V0IHRoYXQgDQptYWlubGluZWQsIHRoZW4gSSBjYW4gc3VibWl0IHRoZSByN3M5MjEwLmR0
c2kuDQoNCj4gICA1LiBBZGQgYW4gT0ZfRUFSTFlDT05fREVDTEFSRSgpIGZvciBSWi9BMiwgc2V0
dGluZyBwb3J0X2NmZy5yZWd0eXBlIHRvDQo+ICAgICAgU0NJeF9SWl9TQ0lGQV9SRUdUWVBFLCB0
byAocHJlc3VtYWJseSkgbWFrZSBlYXJseWNvbiB3b3JrIG9uIFJaL0EyLA0KDQpUaGlzIGlzIHRo
ZSBvbmUgdGhhdCBJIHdhcyBoYXBweSB0byBsZWFybiBob3cgdG8gZG8gaXQgc2luY2Ugb3JpZ2lu
YWxseSANCkkgd2Fzbid0IHN1cmUgaG93IEkgY291bGQgZ2V0IGVhcmx5Y29uIHRvIHdvcmsgd2l0
aCB0aGUgb2RkYmFsbCBSWi9BMiANClNDSUYuDQoNClRoYW5rcywNCkNocmlzDQoNCg==
