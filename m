Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793960279;
	b=il3BCsKCUMNbL4jXsGD2vzBCl6MiKhSjRH6A3mMSzjTsmiFR0TjSIR4ub2MEq1vfv1vH
	 +CpKfJn9aKJEpo5m5wUM+zap2ibZ1ivzIJM6FE3SM+kz+sbj+vNQnu8fyn5cmbyod2qCd
	 mMiyKQjGCBW2vR6yfPqrANBhB2T173pEngxtP8YbyqYzVQX4z5pYreXnzZsEDfe5RKDqW
	 Z9c2XnoxMomjl/d1XwnV9itALGfSgasHReAPcE61sEXqfcgEpHqXN75Dgr2XDsobZAGRf
	 TdpjpLsOtODIdBW59s0l92nVDYA1AfoBL46nY/h8uK+6FFF15lfKbajoCXfg9PLn5JQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793960279;
	h=Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=83X7I5YDbIYy10X4mgzlqvfEyStnFtsT7gAcWs1z/GQ=;
	b=S4mZAV93+cMPQoh3hGoFpXdPd4Buslc+8n7FCsw4V1nGF3bpEEUZuFpoje+d7PdKAJz5
	 ZKd4k5S8foQYH8hBdsUjJ/ZCTVuIrnp0q/ThXZ7ewOOkjyM/mNt7tzstYYqFI052YVEEm
	 pPt0Wzc1E3R0EQqcNrlocmNF0v3QxEPTpbQCYvrcw7OSrbtd1Std2or+CPE5KTFEKc9fA
	 wugLIgGkv8EYpL8PtQ1qxk2HiGVuwuHZL+tzffxAfbZ93aUnquoHOYs5M6Cztv8VN/gwQ
	 o2ZCOS/kX0LorqdbbBixYjtGN9h9rEIjllb7hmijO7HQUrhBJk2gpX9UkUZSNor2Erg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17C14606A32C;
	Fri,  6 Nov 2026 10:17:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D8C91F0089F;
	Fri,  6 Nov 2026 10:17:57 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] Renesas SoC fixes for v7.4
Date: Fri,  6 Nov 2026 11:17:50 +0100
Message-ID: <cover.1793960114.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi SoC folks,

The following changes since commit 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4:

  Linux 7.4-rc1 (2026-11-01 13:26:31 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-fixes-for-v7.4-tag1

for you to fetch changes up to 8ca80811c3ba01691b424f4fef4db8960955df4f:

  perf/renesas: Remove remaining RISCV_ALTERNATIVE references (2026-11-02 11:52:48 +0100)

----------------------------------------------------------------
Renesas fixes for v7.4

  - Fix enabling RZ/Five support.

Thanks for pulling!

----------------------------------------------------------------
Geert Uytterhoeven (1):
      perf/renesas: Remove remaining RISCV_ALTERNATIVE references

 drivers/perf/Kconfig        | 2 +-
 drivers/soc/renesas/Kconfig | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
