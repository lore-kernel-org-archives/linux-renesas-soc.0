Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:39360 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1732752AbeGKPHG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Jul 2018 11:07:06 -0400
From: Phil Edworthy <phil.edworthy@renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Simon Horman <horms@verge.net.au>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Jiri Slaby <jslaby@suse.com>,
        Joshua Scott <joshua.scott@alliedtelesis.co.nz>,
        "ed.blake@sondrel.com" <ed.blake@sondrel.com>,
        "Stefan.Potyra@elektrobit.com" <Stefan.Potyra@elektrobit.com>
Subject: RE: [PATCH 2/2] serial: 8250_dw: Add compatible string for Renesas
 RZ/N1 UART
Date: Wed, 11 Jul 2018 15:02:14 +0000
Message-ID: <TY1PR01MB1769F9774BC336B8670704BBF55A0@TY1PR01MB1769.jpnprd01.prod.outlook.com>
References: <1531312174-17489-1-git-send-email-phil.edworthy@renesas.com>
 <1531312174-17489-3-git-send-email-phil.edworthy@renesas.com>
 <CAMuHMdWHPp4kGzPqkhCKOxNSiKgkrb=w76tofSb4SwP5DF5tdw@mail.gmail.com>
In-Reply-To: <CAMuHMdWHPp4kGzPqkhCKOxNSiKgkrb=w76tofSb4SwP5DF5tdw@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

SGkgR2VlcnQsDQoNCk9uIDExIEp1bHkgMjAxOCAxMzo0MiwgR2VlcnQgVXl0dGVyaG9ldmVuIHdy
b3RlOg0KPiBPbiBXZWQsIEp1bCAxMSwgMjAxOCBhdCAyOjMwIFBNIFBoaWwgRWR3b3J0aHkgd3Jv
dGU6DQo+ID4gVGhlIFJlbmVzYXMgUlovTjEgVUFSVCBpcyBiYXNlZCBvbiB0aGUgU3lub3BzeXMg
RFcgVUFSVCwgYnV0IGhhcw0KPiA+IGFkZGl0aW9uYWwgcmVnaXN0ZXJzIGZvciBETUEuIFRoaXMg
cGF0Y2ggZG9lcyBub3QgYWRkcmVzcyB0aGUgY2hhbmdlcw0KPiA+IHJlcXVpcmVkIGZvciBETUEg
c3VwcG9ydCwgaXQgc2ltcGx5IGFkZHMgdGhlIGNvbXBhdGlibGUgc3RyaW5nLg0KPiA+DQo+ID4g
U2lnbmVkLW9mZi1ieTogUGhpbCBFZHdvcnRoeSA8cGhpbC5lZHdvcnRoeUByZW5lc2FzLmNvbT4N
Cj4gDQo+IFRoYW5rcyBmb3IgeW91ciBwYXRjaCENCj4gDQo+IFdoYXQgaGFwcGVucyBpZiBzb21l
b25lIHdvdWxkIGJvb3QgYSBrZXJuZWwgdGhhdCBoYXMgb25seSB0aGlzIHBhdGNoDQo+IGFwcGxp
ZWQgYW5kIGEgRFRCIHRoYXQgYWxyZWFkeSBoYXMgdGhlIHRvLWJlLXN1cHBvcnRlZCBkbWFzIHBy
b3BlcnRpZXM/DQpUaGUgZHJpdmVyIG9ubHkgc2V0cyB1cCBkbWEgaWYgdGhlIGZpZm8gZGVwdGgg
aXMgPjAsIGFuZCB0aGlzIGlzIHJlYWQgZnJvbQ0KQ1BSIHJlZ2lzdGVyLiBUaGlzIGlzIGFuIG9w
dGlvbmFsIChhcyBpbiBSVEwgY29uZmlndXJhdGlvbikgcmVnaXN0ZXIgZm9yIHRoZQ0KU3lub3Bz
eXMgVUFSVCBibG9jay4gT24gcnpuMSBkZXZpY2VzLCB0aGlzIHJlZ2lzdGVyIHJldHVybnMgMCwg
c28gdGhlDQpkcml2ZXIgd2lsbCBub3Qgc2V0IHVwIGRtYSA9PiBzbyB0aGUgdWFydCBzdGlsbCB3
b3Jrcy4NCg0KQWRkaXRpb25hbGx5LCB0aGUgdWFydCBub3JtYWxseSB1c2VkIGZvciB0aGUgY29u
c29sZSAodXNlZCBiZWNhdXNlIHRoZSANCkJvb3RST00gdXNlcyBpdCkgZG9lcyBub3QgaGF2ZSBh
bnkgZG1hIGNhcGFiaWxpdGllcy4NCg0KVGhhbmtzDQpQaGlsDQoNCj4gPiAtLS0gYS9kcml2ZXJz
L3R0eS9zZXJpYWwvODI1MC84MjUwX2R3LmMNCj4gPiArKysgYi9kcml2ZXJzL3R0eS9zZXJpYWwv
ODI1MC84MjUwX2R3LmMNCj4gPiBAQCAtNjkzLDYgKzY5Myw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1
Y3Qgb2ZfZGV2aWNlX2lkIGR3ODI1MF9vZl9tYXRjaFtdDQo+ID0gew0KPiA+ICAgICAgICAgeyAu
Y29tcGF0aWJsZSA9ICJzbnBzLGR3LWFwYi11YXJ0IiB9LA0KPiA+ICAgICAgICAgeyAuY29tcGF0
aWJsZSA9ICJjYXZpdW0sb2N0ZW9uLTM4NjAtdWFydCIgfSwNCj4gPiAgICAgICAgIHsgLmNvbXBh
dGlibGUgPSAibWFydmVsbCxhcm1hZGEtMzh4LXVhcnQiIH0sDQo+ID4gKyAgICAgICB7IC5jb21w
YXRpYmxlID0gInJlbmVzYXMsdWFydC1yem4xIiB9LA0KPiANCj4gcmVuZXNhcyxyem4xLXVhcnQN
Cj4gDQo+ID4gICAgICAgICB7IC8qIFNlbnRpbmVsICovIH0NCj4gDQo+IEdye29ldGplLGVldGlu
Z31zLA0KPiANCj4gICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQNCj4gDQo+IC0tDQo+IEdl
ZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0g
Z2VlcnRAbGludXgtDQo+IG02OGsub3JnDQo+IA0KPiBJbiBwZXJzb25hbCBjb252ZXJzYXRpb25z
IHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0DQo+IHdo
ZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Ig
c29tZXRoaW5nIGxpa2UgdGhhdC4NCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAt
LSBMaW51cyBUb3J2YWxkcw0K
