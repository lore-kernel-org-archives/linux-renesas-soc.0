Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pu1apc01on0135.outbound.protection.outlook.com ([104.47.126.135]:64177
        "EHLO APC01-PU1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1752604AbcJDKYK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 Oct 2016 06:24:10 -0400
From: Jithin T Raj <jithin.t@tataelxsi.co.in>
To: "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
CC: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Kernel configuration R-Car ALT(E2)
Date: Tue, 4 Oct 2016 10:24:06 +0000
Message-ID: <SG2PR0401MB12961C5C8C7E01027ED8E278D8C50@SG2PR0401MB1296.apcprd04.prod.outlook.com>
Content-Language: en-US
Content-Type: multipart/mixed;
        boundary="_002_SG2PR0401MB12961C5C8C7E01027ED8E278D8C50SG2PR0401MB1296_"
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

--_002_SG2PR0401MB12961C5C8C7E01027ED8E278D8C50SG2PR0401MB1296_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

   Thank you..shmobile_defconfig solvs my problem..now Ibuild kernel and de=
ployed through nfs tftp into ALT Board..The board is accepting kernel but a=
fter some time I am getting some errors..I have attached the error log here

I have the rootfs of ALT Board in /exports folder..


Best Regards
Jithin T Raj
=20
=20
   =

--_002_SG2PR0401MB12961C5C8C7E01027ED8E278D8C50SG2PR0401MB1296_
Content-Type: application/octet-stream; name="errorlog"
Content-Description: errorlog
Content-Disposition: attachment; filename="errorlog"; size=1625;
	creation-date="Tue, 04 Oct 2016 10:23:57 GMT";
	modification-date="Tue, 04 Oct 2016 10:23:57 GMT"
Content-Transfer-Encoding: base64

SU5JVDogdmVyc2lvbiAyLjg4IGJvb3RpbmcKU3RhcnRpbmcgdWRldgpbICAgIDcuMDgzNzc5XSB1
ZGV2ZFs2NzldOiBzdGFydGluZyB2ZXJzaW9uIDE4MgpTdGFydGluZyBCb290bG9nIGRhZW1vbjog
Ym9vdGxvZ2Q6IGNhbm5vdCBhbGxvY2F0ZSBwc2V1ZG8gdHR5OiBObyBzdWNoIGZpbGUgb3IgZGly
ZWN0b3J5CmJvb3Rsb2dkLgpbICAgIDguMDQ3NTAzXSByYW5kb206IGRkOiB1bmluaXRpYWxpemVk
IHVyYW5kb20gcmVhZCAoNTEyIGJ5dGVzIHJlYWQsIDk1IGJpdHMgb2YgZW50cm9weSBhdmFpbGFi
bGUpClBvcHVsYXRpbmcgZGV2IGNhY2hlCkFMU0E6IFJlc3RvcmluZyBtaXhlciBzZXR0aW5ncy4u
LgovdXNyL3NiaW4vYWxzYWN0bDogbG9hZF9zdGF0ZToxNzI5OiBObyBzb3VuZGNhcmRzIGZvdW5k
Li4uCmh3Y2xvY2s6IGNhbid0IG9wZW4gJy9kZXYvbWlzYy9ydGMnOiBObyBzdWNoIGZpbGUgb3Ig
ZGlyZWN0b3J5ClR1ZSBNYXkgMTIgMDk6NDM6MDAgVVRDIDIwMTUKSU5JVDogRW50ZXJpbmcgcnVu
bGV2ZWw6IDVtaXNjL3J0Yyc6IE5vIApDb25maWd1cmluZyBuZXR3b3JrIGludGVyZmFjZXMuLi4g
WyAgICA5LjU0OTk3NF0gcmFuZG9tOiBub25ibG9ja2luZyBwb29sIGlzIGluaXRpYWxpemVkCmlm
dXAgc2tpcHBlZCBmb3IgbmZzcm9vdCBpbnRlcmZhY2UgZXRoMApydW4tcGFydHM6IC9ldGMvbmV0
d29yay9pZi1wcmUtdXAuZC9uZnNyb290IGV4aXRlZCB3aXRoIGNvZGUgMQpTdGFydGluZyBzeXN0
ZW0gbWVzc2FnZSBidXM6IGRidXMuClBWUlNSVktNX1BBUkFNUz0KTW9kdWxlIHB2cnNydmttIGZh
aWxlZCB0byBsb2FkLiBSZXRyeWluZy4KUnVubmluZyAvc2Jpbi9kZXBtb2QKZGVwbW9kOiBFUlJP
UjogY291bGQgbm90IG9wZW4gZGlyZWN0b3J5IC9saWIvbW9kdWxlcy80LjcuNTogTm8gc3VjaCBm
aWxlIG9yIGRpcmVjdG9yeQpkZXBtb2Q6IEZBVEFMOiBjb3VsZCBub3Qgc2VhcmNoIG1vZHVsZXM6
IE5vIHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkKQ291bGRuJ3QgbG9hZCB2c3AyIG1vZHVsZS4gUmV0
cnlpbmcuLi4KZGVwbW9kOiBFUlJPUjogY291bGQgbm90IG9wZW4gZGlyZWN0b3J5IC9saWIvbW9k
dWxlcy80LjcuNTogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQpkZXBtb2Q6IEZBVEFMOiBjb3Vs
ZCBub3Qgc2VhcmNoIG1vZHVsZXM6IE5vIHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkKQ291bGRuJ3Qg
bG9hZCB2c3AyIG1vZHVsZS4KU3RhcnRpbmcgRHJvcGJlYXIgU1NIIHNlcnZlcjogZHJvcGJlYXIu
ClN0YXJ0aW5nIHJwY2JpbmQgZGFlbW9uLi4uZG9uZS4KU3RhcnRpbmcgYWR2YW5jZWQgcG93ZXIg
bWFuYWdlbWVudCBkYWVtb246IE5vIEFQTSBzdXBwb3J0IGluIGtlcm5lbAooZmFpbGVkLikKaHdj
bG9jazogY2FuJ3Qgb3BlbiAnL2Rldi9taXNjL3J0Yyc6IE5vIHN1Y2ggZmlsZSBvciBkaXJlY3Rv
cnkKU3RhcnRpbmcgc3lzbG9nZC9rbG9nZDogZG9uZQogKiBTdGFydGluZyBBdmFoaSBtRE5TL0RO
Uy1TRCBEYWVtb246IGF2YWhpLWRhZW1vbiAgICAgICAgICAgICAgICAgICAgICAgWyBvayBdClN0
YXJ0aW5nIFRlbGVwaG9ueSBkYWVtb24KU3RhcnRpbmcgTGludXggTkZDIGRhZW1vbgpTdG9wcGlu
ZyBCb290bG9nIGRhZW1vbjogYm9vdGxvZ2QuCgo=

--_002_SG2PR0401MB12961C5C8C7E01027ED8E278D8C50SG2PR0401MB1296_--
