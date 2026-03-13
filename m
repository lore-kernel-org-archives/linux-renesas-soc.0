Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 738F233F385;
	Fri, 13 Mar 2026 11:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773400386; cv=none; b=AFa6RGaFq2dWv0opZj1piA/v3pnFY+2wBn8Z28ZeCqc7l/IxWxJsEaLoVt6h5NLSDzyNIQVnfUq7tHuAQBJfIFCYxCu7rKqyA72Ei3T6TsdxqiB8nxkbwfpqRERw6yHajAvEmkBg1/UH/1w4jYVCP0gVJjzKYWxHTb7OmCX6zKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773400386; c=relaxed/simple;
	bh=a9udc4BiZozMz7sASMMATmfAX10s/JHuuv+AWue6yEA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BI2s62WeIq7z6hG+csdnMeZs2sSNeEtLV4sN81pJnO23uR/bX8Uzml55SGJkLyNyKEqISRdqG46gG6PXoFS3QhGDVCjfrwsQz0FcZr30q9nTZV9LZn4cUM9p/VnOA/VDqNG8QgN0Qa9eRNLRZxqCDUwNl7RK2RIW4D8GYKrSqao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EADBAC19424;
	Fri, 13 Mar 2026 11:13:04 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 1/4] Renesas ARM defconfig updates for v7.1
Date: Fri, 13 Mar 2026 12:12:57 +0100
Message-ID: <cover.1773399670.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1773399669.git.geert+renesas@glider.be>
References: <cover.1773399669.git.geert+renesas@glider.be>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-defconfig-for-v7.1-tag1

for you to fetch changes up to 8c6cccefb33e20224ef35497e3f55ee360942f14:

  ARM: shmobile: defconfig: Refresh for v7.0-rc1 (2026-03-06 13:42:09 +0100)

----------------------------------------------------------------
Renesas ARM defconfig updates for v7.1

  - Refresh the ARM SH-Mobile defconfig for v7.0-rc1.

----------------------------------------------------------------
Geert Uytterhoeven (1):
      ARM: shmobile: defconfig: Refresh for v7.0-rc1

 arch/arm/configs/shmobile_defconfig | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)
