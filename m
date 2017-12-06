Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:6269 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751680AbdLFLVm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Dec 2017 06:21:42 -0500
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
        Simon Horman <horms@verge.net.au>
CC: Chris Paterson <Chris.Paterson2@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: RE: [PATCH 1/8] ARM: dts: r8a7745: Add APMU node and second CPU core
Date: Wed, 6 Dec 2017 11:21:37 +0000
Message-ID: <TY1PR06MB089533C44E4B42D647C2CC25C0320@TY1PR06MB0895.apcprd06.prod.outlook.com>
References: <1505322341-9480-1-git-send-email-chris.paterson2@renesas.com>
 <1505322341-9480-2-git-send-email-chris.paterson2@renesas.com>
 <20170915074551.GF3924@verge.net.au>
 <CAMuHMdWrMiHQz_Tadh3R00n+zeSnGOW-o=skbK-R-yD6Z-x2+A@mail.gmail.com>
 <TY1PR06MB0895763DA6DE79A64B9981ECC06C0@TY1PR06MB0895.apcprd06.prod.outlook.com>
 <20170915110609.GL3924@verge.net.au>
 <CAMuHMdUuF4kwUiUYCbSew3W0Pa2CfRdCijefbOO1ZYAbnyG3KA@mail.gmail.com>
In-Reply-To: <CAMuHMdUuF4kwUiUYCbSew3W0Pa2CfRdCijefbOO1ZYAbnyG3KA@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

SGVsbG8gR2VlcnQsIFNpbW9uLA0KDQo+DQo+IEFzIHRoZSBkZXBlbmRlbmN5IGlzIGluIHY0LjE1
LXJjMSwgaXQgY2FuIGJlIGFwcGxpZWQgbm93Lg0KPg0KDQp3ZSB0aG91Z2h0IGV4YWN0bHkgdGhl
IHNhbWUgdGhpbmcsIHRoZXJlZm9yZSB3ZSByZWJhc2VkIGFuZCB3ZSByZS1yYW4gb3VyIHRlc3Rz
LCB0byBkaXNjb3ZlciB0aGF0IHNvbWV0aGluZyBicm9rZSBpbiBiZXR3ZWVuIHZlcnNpb25zLg0K
SSdsbCBiZSBpbiB0b3VjaCBvbmNlIEkgaGF2ZSBtb3JlIGluZm9ybWF0aW9uLCBidXQgaXQncyBh
IG5vIGdvIGZvciBub3cuDQoNClRoYW5rcywNCkZhYg0KDQoNCltodHRwczovL3d3dzIucmVuZXNh
cy5ldS9tZWRpYS9lbWFpbC91bmljZWZfMjAxNy5qcGddDQoNClRoaXMgQ2hyaXN0bWFzLCBpbnN0
ZWFkIG9mIHNlbmRpbmcgb3V0IGNhcmRzLCBSZW5lc2FzIEVsZWN0cm9uaWNzIEV1cm9wZSBoYXZl
IGRlY2lkZWQgdG8gc3VwcG9ydCBVbmljZWYgd2l0aCBhIGRvbmF0aW9uLiBGb3IgZnVydGhlciBk
ZXRhaWxzIGNsaWNrIGhlcmU8aHR0cHM6Ly93d3cudW5pY2VmLm9yZy8+IHRvIGZpbmQgb3V0IGFi
b3V0IHRoZSB2YWx1YWJsZSB3b3JrIHRoZXkgZG8sIGhlbHBpbmcgY2hpbGRyZW4gYWxsIG92ZXIg
dGhlIHdvcmxkLg0KV2Ugd291bGQgbGlrZSB0byB0YWtlIHRoaXMgb3Bwb3J0dW5pdHkgdG8gd2lz
aCB5b3UgYSBNZXJyeSBDaHJpc3RtYXMgYW5kIGEgcHJvc3Blcm91cyBOZXcgWWVhci4NCg0KDQoN
ClJlbmVzYXMgRWxlY3Ryb25pY3MgRXVyb3BlIEx0ZCwgRHVrZXMgTWVhZG93LCBNaWxsYm9hcmQg
Um9hZCwgQm91cm5lIEVuZCwgQnVja2luZ2hhbXNoaXJlLCBTTDggNUZILCBVSy4gUmVnaXN0ZXJl
ZCBpbiBFbmdsYW5kICYgV2FsZXMgdW5kZXIgUmVnaXN0ZXJlZCBOby4gMDQ1ODY3MDkuDQo=
