Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB4CB350D4F;
	Sat, 28 Mar 2026 12:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774699873; cv=none; b=p+TFaY8uZ/9JZTdfb35E3AK2M7urG8yOGNVhtsVcsrkYtwyylt7ud3wG9/XYC6SM9iIbmEUt3RhD2X4P1FgMMf38KhbB/fx7krMDXy72DjoGpyaG0UXwh9oah0+sjbr9/tR/Hq3WDxWVDI0gNBJWYj2chKmFbeNuOzIfEFYiXI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774699873; c=relaxed/simple;
	bh=+MtEyjWMqpnaIyEuU5Jy6fs2mMZ565cFVd//nf7exS0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dzq54HXm1CBmujj6ee4P8qzYrQg8+GXmzaC899wOfIVEn3aTJefSAB2K6e2PpSTZloxrgiC1IGc5yCDJjbyS9Dm0M3s3A3lZZZmyQqs/3WspRUendtyXzu0z3QiuU//XWG9dZX0ma82iHrjKD02Rq0XPf+MYnOf2YyMLzoY1VTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BDE4C4CEF7;
	Sat, 28 Mar 2026 12:11:11 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 1/3] Renesas ARM SoC updates for v7.1
Date: Sat, 28 Mar 2026 13:11:04 +0100
Message-ID: <cover.1774606538.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1774606536.git.geert+renesas@glider.be>
References: <cover.1774606536.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-soc-for-v7.1-tag1

for you to fetch changes up to d784bbad7fcbfad42e0d12c8dae2eb9c17b327b4:

  ARM: shmobile: rcar-gen2: Use of_phandle_args_equal() helper (2026-03-16 10:59:59 +0100)

----------------------------------------------------------------
Renesas ARM SoC updates for v7.1

  - Use the of_phandle_args_equal() helper.

----------------------------------------------------------------
Geert Uytterhoeven (1):
      ARM: shmobile: rcar-gen2: Use of_phandle_args_equal() helper

 arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)
