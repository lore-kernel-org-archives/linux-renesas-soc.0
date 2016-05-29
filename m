Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:58948 "EHLO pokefinder.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932315AbcE2Ppi (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Sun, 29 May 2016 11:45:38 -0400
Date: Sun, 29 May 2016 17:45:31 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: linux-renesas-soc@vger.kernel.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PULL REQUEST] renesas/topic/pretimeout for renesas drivers
Message-ID: <20160529154528.GA6451@katana>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="MGYHOYXEY6WxJCY8"
Content-Disposition: inline
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--MGYHOYXEY6WxJCY8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Geert,

here is a topic branch for renesas-drivers. Please pull.

Kind regards,

   Wolfram


The following changes since commit 2dcd0af568b0cf583645c8a317dd12e344b1c72a:

  Linux 4.6 (2016-05-15 15:43:13 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/topic/pretimeout

for you to fetch changes up to 192d88ad087a1f20505c3249c6d51992d9f3caa8:

  watchdog: pretimeout: add userspace notifier pretimeout governor (2016-05-25 15:35:15 +0200)

----------------------------------------------------------------
Vladimir Zapolskiy (3):
      watchdog: pretimeout: add panic pretimeout governor
      watchdog: pretimeout: add noop pretimeout governor
      watchdog: pretimeout: add userspace notifier pretimeout governor

Wolfram Sang (13):
      watchdog: softdog: remove obsolete comments
      watchdog: softdog: use watchdog core to init timeout value
      watchdog: softdog: consistently use softdog_ prefix
      watchdog: softdog: remove forward declaration
      watchdog: softdog: sort includes to avoid duplicates
      watchdog: softdog: drop superfluous set_timeout callback
      watchdog: softdog: improve coding style
      watchdog: add watchdog pretimeout framework
      watchdog: documentation: squash paragraphs about 'no set_timeout'
      watchdog: add pretimeout support to the core
      fs: compat_ioctl: add pretimeout functions for watchdogs
      watchdog: softdog: implement pretimeout support
      watchdog: dev: add helper for creating uevent on dev

 Documentation/watchdog/watchdog-kernel-api.txt |  24 ++-
 drivers/watchdog/Kconfig                       |  68 +++++++
 drivers/watchdog/Makefile                      |  10 +-
 drivers/watchdog/pretimeout_noop.c             |  47 +++++
 drivers/watchdog/pretimeout_panic.c            |  47 +++++
 drivers/watchdog/pretimeout_userspace.c        |  47 +++++
 drivers/watchdog/softdog.c                     | 110 ++++------
 drivers/watchdog/watchdog_dev.c                |  81 +++++++-
 drivers/watchdog/watchdog_pretimeout.c         | 269 +++++++++++++++++++++++++
 drivers/watchdog/watchdog_pretimeout.h         |  43 ++++
 fs/compat_ioctl.c                              |   2 +
 include/linux/watchdog.h                       |  24 +++
 12 files changed, 695 insertions(+), 77 deletions(-)
 create mode 100644 drivers/watchdog/pretimeout_noop.c
 create mode 100644 drivers/watchdog/pretimeout_panic.c
 create mode 100644 drivers/watchdog/pretimeout_userspace.c
 create mode 100644 drivers/watchdog/watchdog_pretimeout.c
 create mode 100644 drivers/watchdog/watchdog_pretimeout.h

--MGYHOYXEY6WxJCY8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXSw6YAAoJEBQN5MwUoCm2zvAQAI4WRWCiH4nRT2okFmDlt9md
/NHYgM2KsMi9oh0pHeTLJxlMvfp+MuajLHYPDzzwTdrh88Gepw0F8ocO8jLRi74P
bup1ifbbLC2ucXQLWg11G9dhiJ8/EywhnnnjKw8aUOSF8nAepJ/GUudLp9xkPPi7
7hHjYykuHmcA1ouf9R12i6LOmSPkZyeUM5m92zbXQn22VL6Yuju0v+ocj45nKRDz
zr+5d1JA0Kk19HSFKm2LEpZ0VDPn9ix3lPBmMP+0sdEzRLDQNgNyeaDjr19AKvdM
woJDX8az5iuCsfZa4NdSOaCblYL76VRZSFCDFMkxpaNeMSfA9I3G7bW6YcOHzVdL
KzPBVhVEtG6OfrvhLopiAoy24ttvI+ZdW3+e30WdIjMza+WuwpsThAGUYRfrv7p6
ao+d+4qr6Z6sJanucl23anhDqj9BknzjYPymqONMDi/2Eqc1WhBTS8EDXP89fLyx
+MQ+CYbXSYqhYcRFBocJrgvlpWW83C0s8wT4DsCgkW3JI5U+sveHcFUx8VS6WLtL
Wk7lFQREJrYiXrAVHzt/bYVJKgzKmNiYmpevu3Ko2APYUODHs6ru32MyiA3zpNF6
QerciT48orutpgjKX4eSGX9OFXw5hlbSFMzjVwaeBjs7NDX/KbY6N+TunBJodhaR
lvGJWfeteLi1NHDqacbR
=iNXL
-----END PGP SIGNATURE-----

--MGYHOYXEY6WxJCY8--
