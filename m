Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 364BA3438BA;
	Thu, 16 Jul 2026 10:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784196231; cv=none; b=Rmi1GBbx3Z0kccdskC57t0qwCsXMLgtUS5APNmkDhkUolO1LblQ2UA40NbveOgyCbKNaF/TYROdlVkZhjBqM3seck7hzNNsZCu/dJpCc7DLWo9Fxj7gY9nDOrv36fI3HLznJw7JMcpAxL82r4dHjhpBJwC3wxfmsi5PDynpQrw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784196231; c=relaxed/simple;
	bh=OULebcKWDelmhWZp4d6S/v2tI/igj2V4U0kjeufB/+M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h00aRWuGcuznEpcvAkv4Wr5dmSeOxdJrUgcD45ljSI3CZSS4xvT1/VVAvvt6/GW7hbKGHtuctmtLCQkcqlu63GlNxs2jg703yXuS7e9GhYBjupfSBXhwnFfDKaLaj3r1MdbhYUzxROQ8sIj6iZHGoBkm9lthZPFrZGm+BHSeGmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0C381F00A3A;
	Thu, 16 Jul 2026 10:03:48 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 0/3] Renesas SoC updates for v7.3
Date: Thu, 16 Jul 2026 12:03:40 +0200
Message-ID: <cover.1784194401.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi SoC folks,

This is my first pull request for the inclusion of Renesas SoC updates
for v7.3.

It consists of 3 parts:

  [GIT PULL 1/3] Renesas ARM SoC updates for v7.3

    - Use the of_machine_compatible_match() helper.

  [GIT PULL 2/3] Renesas driver updates for v7.3

    - Drop duplicate default for ARCH_R8A78000.

  [GIT PULL 3/3] Renesas DTS updates for v7.3

    - Add sound support for the RZ/G3E SoC and the RZ/G3E SMARC EVK board,
    - Add more serial and SPI support for the RZ/G3L SoC and the RZ/G3L
      SMARC EVK board,
    - Add SMP support (32x Cortex-A720AE) for the R-Car X5H SoC,
    - Add hwspinlock and mailbox (MFIS) support for the R-Car V4H SoC,
    - Add GPU support for R-Car M3-N-based Salvator-X(S) and ULCB
      development boards,
    - Add SPI and FRAM support for the RZ/N1D SoC and the RZN1D Expansion
      Board,
    - Add PCIe support for the RZ/V2H SoC and the RZ/V2H EVK development
      board,
    - Miscellaneous fixes and improvements.

Note that the third PR is based on renesas-fixes-for-v7.2-tag1, for
which I have just sent a PR.

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
