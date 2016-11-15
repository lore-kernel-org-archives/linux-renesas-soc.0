Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from www.zeus03.de ([194.117.254.33]:41132 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752731AbcKOOqo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Nov 2016 09:46:44 -0500
Date: Tue, 15 Nov 2016 15:40:00 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: linux-renesas-soc@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>
Subject: Testing SDIO with UHS speeds
Message-ID: <20161115143959.GA10334@katana>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="vkogqOf2sHV7VnPd"
Content-Disposition: inline
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--vkogqOf2sHV7VnPd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

I put the test procedure how I tested SDIO with UHS speeds to the elinux
wiki. You can find it here:

http://elinux.org/Tests:SDIO-with-UHS

While the task description only mandated H3 and a AC-180M SDIO card, I
also did some extra tests on M3-W and an EMMY-W1 SDIO card (which has
the same SD8887 chipset from Marvell) to have better comparison.

Quite some remarks coming from this setup:

A) A seperate branch is needed, merging SDHI-DMA support into ren-drivers
and adding 5 more little patches. 2 are aleady on their way upstream and
one will be taken care of by mwifiex maintainers. One remaining is a
workaround for a race condition when enabling SDIO irqs. This surely
needs further investigation. And one has to do with TDSEL settings
again. I plan to write up my TDSEL findings and experiences next Monday.

B) Operating at 100MHz for SDR50, it is no surprise that line lengths and
other line characteristics are heavily influencing the result:

  1) my M3-W seems to be more stable than my H3 (ES 1.0)

  While testing transfer speeds, H3 gave me occasional "timeout waiting
  for SD bus idle". M3-W did not, with the same pinctrl settings.

  2) on H3, CN14 seems to be more stable than CN13

  ?? Line length issues?

  3) the EMMY-W1 module seems to be more stable than the AC-180M

  AC-180M already has problems loading the firmware. The supplied antenna
  gives way worse signals than EMMY-W1. AC-180M does not really fit into
  CN14 due to its size and needs to be held in position manually.
  AC-180M couldn't be tuned with SDR104 unlike EMMY-W1.

  But I really hope that at least the antenna issue is only local for
  me and there will be better results with the other cards in Japan.

C) UHS is faster than non-UHS, 802.11ac than 802.11n, but just a little

For the more stable EMMY card, SDR50 gives more throughput than standard
hi-speed, but more could be expected. Same goes for switching from
802.11n to 802.11ac.


Further notes:

Tests have mainly been done with SDIO irqs. Occasional tests with
polling did not make a difference in performance. The only notable
difference was experiencing the race condition mentioned above and
worked around in the git repo.

All tests have been done with 4 bit bus width. When aiming for UHS
speeds, 1 bit bus width didn't seem feasible.

Hotplugging worked fine. Whenever a stable pinmux setting was found
(TDSEL!), un- and replugging the SDIO card worked flawlessly.

Thanks,

   Wolfram


--vkogqOf2sHV7VnPd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJYKx4/AAoJEBQN5MwUoCm2dCIP/Rph8Fq81OXGZmC30/eAj47b
zvW857KQTAjeCqC+qcFHZET2rsdkpFtBXD/B8CngWQIkNFvHn+lZ9ERCImv4uv10
lrk9yVsVI1EzDLZryZVYtG3Ss0pexbef6X5F3Di+18fIQvta9seJIX2At1CjdDlB
qAUJdGoKcQFXUXURGHYbMyOJQurCWJ1RVZiI9bRn8mRZiZATpQzZJM5frzVLdaRE
7m3z38ZuZL3QZwlzQcMB5jvzk56AupHKAlz0wkP+1kmNs76g3C0Q3UdSzpkimXrF
5UCyNRS5nHrZtNgJTaTBirMavMVwneNwwk4MDbIjhz8Lu3yIn2cmaK3rH5lVk6hC
eY2dIhVJkmh7WwRt8znIC+X8RqrJgUjrG2dsBKET6wmQdShM3WyjVIcD+UuQlhai
gwSdjUTqEptlfak01MwS9UIpr1qLE24NOUWe08a9VWIA4azQkfw3NXzS3DstTchQ
GeedmJvgYXhJ3xkZlYVPnRCMjDRQdiwQNQHMwxWp60qvMsZFg5krNfhIWhQ0a2hn
CO78/9u4qOvk3P/O+9P4UEAp8Ii0rPua+8xy4LSRjV/cpphmIcpT1WtlbOSI3rDo
97uDvXPTzTDmKtYF8LJ660BugnZZMFuClUsWGvaz01+B1hLU4dGwbmQgMbsaTaeM
lwHk6dQ13sgrA/PXsrzi
=h4No
-----END PGP SIGNATURE-----

--vkogqOf2sHV7VnPd--
