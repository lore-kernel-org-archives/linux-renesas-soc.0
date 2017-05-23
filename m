Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor1.renesas.com ([210.160.252.171]:36123 "EHLO
        relmlie4.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1758616AbdEWLHA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 23 May 2017 07:07:00 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Petre Pircalabu <petre.pircalabu@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
CC: "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        "horms@verge.net.au" <horms@verge.net.au>,
        "magnus.damm@gmail.com" <magnus.damm@gmail.com>,
        Petre Pircalabu <Petre_Pircalabu@mentor.com>
Subject: RE: [PATCH] phy: rcar-gen3-usb3: Initial support for xhci phy
Date: Tue, 23 May 2017 11:06:56 +0000
Message-ID: <TY1PR06MB09925965B865FA8437D807EFD8F90@TY1PR06MB0992.apcprd06.prod.outlook.com>
References: <1495043888-20934-1-git-send-email-Petre_Pircalabu@mentor.com>
 <TY1PR06MB09928E2327894F8E9E7738D4D8E40@TY1PR06MB0992.apcprd06.prod.outlook.com>
 <CAMuHMdV4z8TBdBAsWCLNZ4r8vE7Qa-6_X711A2RtBwEa_RNrgg@mail.gmail.com>
 <TY1PR06MB0992B8DC97323FF06A0B7BA3D8E40@TY1PR06MB0992.apcprd06.prod.outlook.com>
 <CAMuHMdVzk6yqV8nB9OrfnQRHG3X=5o2D4wiu_87p0aBzAqBZkg@mail.gmail.com>
 <TY1PR06MB099210D9B30BA7EB7F276455D8E40@TY1PR06MB0992.apcprd06.prod.outlook.com>
 <CAMuHMdWDkrBDhJZQHs2qHR3CL_oK9vb15hXXdLsCauCBw5o6ew@mail.gmail.com>
 <CAKYaQRm+H9Ayp=-jDEO476yW-k_TUzkKunOEZujKhA1X68xHbw@mail.gmail.com>
 <CAKYaQR=W=+f__a5_aXQZSk8_344T2sNr1jJLZiwhyBd6XNLirg@mail.gmail.com>
 <CAKYaQR=7ZgMovp38jhNo2xFU0X2u-SecsPxCAZUa8UpyvdrejA@mail.gmail.com>
In-Reply-To: <CAKYaQR=7ZgMovp38jhNo2xFU0X2u-SecsPxCAZUa8UpyvdrejA@mail.gmail.com>
Content-Language: ja-JP
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

SGkgUGV0cmUtc2FuLA0KDQo+IEZyb206IFBldHJlIFBpcmNhbGFidQ0KPiBTZW50OiBGcmlkYXks
IE1heSAxOSwgMjAxNyA4OjU1IEFNDQo+IA0KPiBIaSBTaGltb2RhLXNhbiwNCj4gDQo+IEkganVz
dCBzYXcgdGhhdCB5b3UgcGF0Y2ggcHJlZGF0ZXMgbWluZS4gSSB3aWxsIGRyb3AgbXkgdmVyc2lv
biBhbmQNCj4gaW50ZWdyYXRlIHlvdXJzLg0KDQpJIGdvdCBpdCENCg0KQmVzdCByZWdhcmRzLA0K
WW9zaGloaXJvIFNoaW1vZGENCg0KPiBNYW55IHRoYW5rcyBmb3IgZm9yIHlvdXIgc3VwcG9ydCwN
Cj4gUGV0cmUNCg0K
