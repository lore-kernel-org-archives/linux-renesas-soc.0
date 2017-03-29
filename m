Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:52981 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754354AbdC2IDW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 29 Mar 2017 04:03:22 -0400
From: Felipe Balbi <balbi@kernel.org>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: "gregkh\@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb\@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-renesas-soc\@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 1/4] usb: gadget: udc: renesas_usb3: add sysfs "role" to set "b-device" mode
In-Reply-To: <PS1PR06MB1692C364D1D62FB487BD12F5D8350@PS1PR06MB1692.apcprd06.prod.outlook.com>
References: <1490702004-8167-1-git-send-email-yoshihiro.shimoda.uh@renesas.com> <1490702004-8167-2-git-send-email-yoshihiro.shimoda.uh@renesas.com> <87efxhhahj.fsf@linux.intel.com> <PS1PR06MB1692F6A720410D53A6972379D8350@PS1PR06MB1692.apcprd06.prod.outlook.com> <87d1d0fx4j.fsf@linux.intel.com> <PS1PR06MB1692C364D1D62FB487BD12F5D8350@PS1PR06MB1692.apcprd06.prod.outlook.com>
Date: Wed, 29 Mar 2017 11:03:07 +0300
Message-ID: <87inmsldc4.fsf@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Yoshihiro-san

Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com> writes:
>> >> Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com> writes:
>> >> > Sadly, to change the role ("host" and "peripheral") of USB3.0 DRD
>> >> > controller on R-Car Gen3, software has to set the DRD_CON register
>> >> > which is included in a usb3.0 peripheral controler's register.
>> >> > To simply implementation, the previous code always set peripheral m=
ode
>> >> > as hardcoded. However, to support usb role swap in the future,
>> >> > the hardcoded is not good. So, this patch adds sysfs "role" to set
>> >> > the mode by a user.
>> >> > After applied this patch, since the DRD controller will act as host
>> >> > mode after probed, a user needs to change the mode via the sysfs.
>> >> >
>> >> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
>> >>
>> >> in patch 3, you add extcon to monitor ID and VBUS pins. Do you really
>> >> need this sysfs file at all?
>> >
>> > Yes. This is because this "role" sysfs file cannot monitor the ID and =
VBUS pins.
>> > The "role" only monitors the mode which is "host" or "peripheral".
>>=20
>> Right, I understand it can't monitor the state of ID/VBUS, but do you
>> have a usecase for that file that's not covered by the other patches in
>> the series? :-)
>
> Thank you for the comment. Since my English skill is not good,
> I don't understand your question.

oh, that's alright. I'll try to explain:

I'm asking if you have any situation where you need userspace to change
the role manually. I understand it's a very nice feature to have during
development because it frees us from searching for "the right cable";
but if the only application of this sysfs file is durinb development,
then perhaps it should be exposed using debugfs instead ;-)

Hopefully that's easier to understand now.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAljbajsACgkQzL64meEa
mQZBQg//fAzP7sviSuxkBJIKiQOkrYKiDFKr6O8dssSF3knKO19Fs2c8leKFrmVy
d9dEy1eiPcU8OQRrVs2IalQ4CucCfKS4TvpaIdaiYAKSkASef8Uvxs29kV5ijLE+
gd0J1ifbGt2hNs4p9b1UUQmZ9Ztx3dn9w0vYisWmpZt8ueAMzpjn9bsO1elfeko5
Mh3+Mp2HqmXn247Eoimar2mCKZI2llN4SUUTXbLT/+OGGrwyXE+HVJ966iKvDJ/I
fBK9OtL5SiOFg4nvzDZbIhtKqHE8x+9QagdRKHDeQfeUvt96lNQkYYrsfj5u2w2j
5106VM/sqkv/sabCsXv852PUPi+KajmFbCvvtREUCrqUTkm9TdvZp3xcTqaz5bey
qUz1p23uJKswt0v2iSNd7ajXZl52UHMpKD7We96QWWC4I9d712/dVY42IgjSB3E8
4xm5MJ/faw8RuCeusqhig+fdDdRi6ky+55Uo4+trANZejBDn927mzUNX+u/Mbcap
onFGscV4xpbgcjbVsYNr2uZfbYp03biakhdt9P1n/gcWLggdeXErTdnShm22/soN
9dfIU37OqpAP4WZ2aO9Cgn0BUAUGRbAujkRLdTerkKY7fH+cua4X39TGGHBBgl66
EVRbERgYD1yTTw8CowNr9xPsIyVYhTEGSYI4DXHxd1Phx0sTcQ4=
=2Q+u
-----END PGP SIGNATURE-----
--=-=-=--
