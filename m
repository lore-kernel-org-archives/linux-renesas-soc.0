Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Tue, 21 Feb 2017 12:07:12 +0100
From: Pavel Machek <pavel@ucw.cz>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lina Iyer <lina.iyer@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Len Brown <len.brown@intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH/RFC 3/6] drivers: firmware: psci: Implement shallow
 suspend mode
Message-ID: <20170221110712.GB5021@amd>
References: <1487622809-25127-1-git-send-email-geert+renesas@glider.be>
 <1487622809-25127-4-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="i9LlY+UWpKt15+FH"
Content-Disposition: inline
In-Reply-To: <1487622809-25127-4-git-send-email-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--i9LlY+UWpKt15+FH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Enable support for "shallow" suspend mode, also known as "Standby" or
> "Power-On Suspend".
>=20
> As secondary CPU cores are taken offline, "shallow" suspend mode saves
> slightly more power than "s2idle", but less than "deep" suspend mode.
> However, unlike "deep" suspend mode, "shallow" suspend mode can be used
> regardless of the presence of support for PSCI_SYSTEM_SUSPEND, which is
> an optional API in PSCI v1.0.

If system supports "shallow" suspend, why does not PSCI implement it?

In the past, I was told PSCI will not turn into ACPI-like mess, and
that we'll be able to fix PSCI and will not have to work around its
problems in kernel :-(.

Not your fault, Mark made those promises.
								Pavel
							=09
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--i9LlY+UWpKt15+FH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlisH2AACgkQMOfwapXb+vL47QCeMEtnQeR77gPJgALoVZZgYNzi
N7MAnjSylRHLAOXHzQ4x8iQfRP9DAR32
=hO/e
-----END PGP SIGNATURE-----

--i9LlY+UWpKt15+FH--
