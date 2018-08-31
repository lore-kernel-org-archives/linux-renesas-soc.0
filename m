Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:2167 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727292AbeHaNVB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 31 Aug 2018 09:21:01 -0400
From: Biju Das <biju.das@bp.renesas.com>
To: "sergei.shtylyov@cogentembedded.com"
        <sergei.shtylyov@cogentembedded.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
CC: batareich batareich <vladimir.barinov@cogentembedded.com>,
        Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
        Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>,
        "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>
Subject: RE: [PATCH] clocksource: sh_cmt: fixup for 64-bit machines
Date: Fri, 31 Aug 2018 09:14:24 +0000
Message-ID: <OSBPR01MB21037B1548962BF0D4D78538B80F0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <8aa6d2cd-68f9-eae4-cba0-222c1511eb9d@cogentembedded.com>
 <TY2PR01MB1962DD773F09F88AD6C954CEC30F0@TY2PR01MB1962.jpnprd01.prod.outlook.com>
In-Reply-To: <TY2PR01MB1962DD773F09F88AD6C954CEC30F0@TY2PR01MB1962.jpnprd01.prod.outlook.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

SGkgU2VyZ2llLA0KDQpUaGFua3MgZm9yIHRoZSBwYXRjaC4NCg0KPiBTdWJqZWN0OiBbUEFUQ0hd
IGNsb2Nrc291cmNlOiBzaF9jbXQ6IGZpeHVwIGZvciA2NC1iaXQgbWFjaGluZXMNCj4NCj4gV2hl
biB0cnlpbmcgdG8gdXNlIENNVCBmb3IgY2xvY2tldmVudHMgb24gUi1DYXIgZ2VuMyBTb0NzLCBJ
IG5vdGljZWQgdGhhdA0KPiB0aGUgbWF4aW11bSBkZWx0YSAoaW4gbnMpIGZvciB0aGUgYnJvYWRj
YXN0IHRpbWVyIHdhcyBkaXBsYXllZCBhcyAxMDAwIGluDQoNCiVzLyBkaXBsYXllZC9kaXNwbGF5
ZWQNCg0KUmVnYXJkcywNCkJpanUNCg0KDQoNCg0KUmVuZXNhcyBFbGVjdHJvbmljcyBFdXJvcGUg
THRkLCBEdWtlcyBNZWFkb3csIE1pbGxib2FyZCBSb2FkLCBCb3VybmUgRW5kLCBCdWNraW5naGFt
c2hpcmUsIFNMOCA1RkgsIFVLLiBSZWdpc3RlcmVkIGluIEVuZ2xhbmQgJiBXYWxlcyB1bmRlciBS
ZWdpc3RlcmVkIE5vLiAwNDU4NjcwOS4NCg==
