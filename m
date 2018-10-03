Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:53092 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726751AbeJCSiJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 3 Oct 2018 14:38:09 -0400
Date: Wed, 3 Oct 2018 13:50:03 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Ulrich Hecht <uli@fpond.eu>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-serial@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH 0/2] serial: sh-sci: Use pm_runtime_get_sync()/put()
Message-ID: <20181003115003.GA1905@kunai>
References: <1523638854-21804-1-git-send-email-ulrich.hecht+renesas@gmail.com>
 <CAMuHMdXn3ngXNFFM6Zsi2-YftvKeWnBSCxoQHd7j3xxFnBORrA@mail.gmail.com>
 <379261410.44634.1537425122812@webmail.strato.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="BXVAT5kNtrzKuDFl"
Content-Disposition: inline
In-Reply-To: <379261410.44634.1537425122812@webmail.strato.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--BXVAT5kNtrzKuDFl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey guys,

I stumbled over this one again and want to make sure we have a
conclusion here.

> The way I understand it, the problem this intends to fix is not the
> state the device ends up in, but that it needs to be powered while
> registers are read or written.

I agree.

> It seems to me that that the current "resume" code should work in that
> respect, because it changes the PM state to "on" in uart_resume_port()
> before any access to hardware registers takes place, so there is
> nothing that needs to be fixed.

Ack.

> That may be different for the "suspend" part, though, because it
> assumes that the PM state is "on", and I think that is what the patch
> asserts to not be a valid assumption anymore. It's hard to tell if
> that is true, though, because I cannot reproduce the issue here; it
> just works either way...

So, do we agree then that *if* there needs to be a fix for that, it
should be in uart_suspend_port() by adding some 'uart_change_pm' shortly
before accessing the ops-callbacks? I am not super-fit with the uart
layer, but can't we assume because of the "Nothing to do if the console
is not suspending"-if-block that (for SCIF at least) it means the port
is on because it _is_ the console?

(I wonder, though, if the OMAPs won't need such a fix because they seem
to use runtime_autosuspend, so their state might be off actually?)

Regards,

   Wolfram


--BXVAT5kNtrzKuDFl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlu0rOUACgkQFA3kzBSg
Kbak7A//VEQuahzKmxkULrPzyWW6yD5IdHId/hcBRQb3AO7BhrkkGtkHMCyZuSQ7
TBTa/d/0QRcpT8WkfF7BjcprOcu+Z4RQj5yib53NI5VY0hL627hg9ezDMRUAqLIt
dq/kgO33YitJDJM2yLlfcY9sEo/43X0ZrTtXeQYI5wDxSABa3fItF47ILlfad9O7
nNA8t5LKQbS+X9bDPayvhYP0cVISH3x7MCE6NOBl16EqJr4YTRKEtT9DoseA+RzH
M4PSHDQM5SPsSvMuuI5mr9Dt0KNp+DSwuDjDpwoSdk766R1yU3kzjNw+PfSY733b
8uRBCJeCcJZhPo10wXCjclPzyce7DT6/twGuZFbAx8gjIHXFKA2aGoVsfOXy574E
Lvhz1NR5dV9UhH3Lu4GyuehqrWBdpowb5u3mht8HaPRBP7YNk6H4Rw2ZIxZAD/w5
iiY2ASgBNWqWVRL3uIUocJ728KwDNkZMmCKwlgCeWSdLQnSLAASHiOVGTGphKFgr
xlqfgjF7H7VA8/bhsZ7zKyXqElslaCnedatqvYcoLJFGBVtPGJN0CXvcTC66dygl
T0SUbLB/AnPPy82oRRhNPIRraTUuRtKuZm44z+7aPGgRVybdDi/zd0XrGNHqWmUU
SwazVpfJ/7h9XaYHdhBh2Vr4Kg7hinKPzeLdySg7ifIOGrGUnVo=
=lfWS
-----END PGP SIGNATURE-----

--BXVAT5kNtrzKuDFl--
