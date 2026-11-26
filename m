Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795730326;
	b=LWkx/g38b3Twoxbk1MlrmS49RWTM++Bxy5J+TF9xCG5loDgQuQ6fyPVi7+CcZ5nd/IyJ
	 6fcElkTJNU4v4f05X+dkOs+6bTGnLEQWy5rl3W+MdMXP8599jz0v5LU2u098TtjrWll93
	 dcvFRCech44di5phuqftjoeQqo1QsWLsRh47o+G/X+6BCjUoKXHB/0M6jd8dvQtXU75Q2
	 0kMjZzeqdVfSL9gw2/Nd+PKZdTnh3TG5jmX5w5d+wiOs4ZXAGAhyV6tqq2hPLCLz3ulmY
	 eDZYzeCZSiXPpuYAYdWXND14wsjLMs+V+pgT45pjSSCFWtHy9tBWPN7e0KsdOq2MA9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795730326;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=5uv6vKw+uzW/Wumcknavba6J4n9f8j4zCL8O++o9Hlk=;
	b=nS4opKc0kjB6rWvf8zAeFJ1BZDjJ5Q9kYp8H0vUhD8r/BsRWADqlDf2USGuXXtJql8ZN
	 QebAtjrKpYqCYkXSwULUcqL3mUUOx74+Z/KHB1sS2qf1fVFPf+zDlpHyw29QDA+7xLUev
	 PRNZrhUblxoJIXvXxTXV6OC40EN4fGkPZBKQt5qkT2z3wOyT+r16caXLcpHh6c6IPLFgc
	 IEkfzBxeIfBcDsE5Cmh19O7WCnpRkaZcKah97dHixs/PZFO56y2sWWqv+VzSmd4NNiOO8
	 4XHH/2rL5pxRhlpuMN9/41uZ+Fo6zn/BMhQBJriVkGZxCHGp2ZjdIu6aGO6t8AU67GQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ytDheMb7;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FB22606A683
	for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Nov 2026 21:58:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FB22606A683
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ytDheMb7
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso40239745e9.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Nov 2026 13:58:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795730323; x=1796335123; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5uv6vKw+uzW/Wumcknavba6J4n9f8j4zCL8O++o9Hlk=;
        b=ytDheMb7CD2LrSJCt1+kuV6K/avkJkP6pnB6PDUMiQLqKHnnXonQInoDVdC6u33cRD
         EJM+ITIgJvKrOEhgtjzbkZcJEZz0o+5whI0q8vmvwOzsekcj5+jzHdm7qebziwNsEtNW
         SnSLfSc4O3MOu0xn01WS73VLIRLhs2QF2sebSN1pcyBVCfSVAV7ekKr9XNN0Rme29zpk
         vcPqeXS/8t5DWwWsyoefFpexXT6f4uRF2CFnMhwVDyjEWNUoyngYVBFEcNgGmY8P2RJz
         Z/7p+85pt1mVoHqklYK6BKBikW+6YuftadaisHoarCZ9gwnYFTQYyNg+bM9FtZKwqCiL
         tK7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795730323; x=1796335123;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5uv6vKw+uzW/Wumcknavba6J4n9f8j4zCL8O++o9Hlk=;
        b=M6wZa4EEvC02Bs035fWpqqRGOZWoA3J6FqlI02aNkK0TPHaUeABe+Q9oRsMjO7Byud
         +X6oQwpVcCkdxldNZ8J/2oVGi19xbdPNieMy643FviHzgHg3+0qtHQBOdWszjGWRTuQ0
         DypwdrEMpQjwlIgYMNRfkh3YEBFvuQVpCjCsL2inXyuviaG23s7sFp0UgbaGyY1EVnVD
         yEmaYzRXBqII8lHhkmvTIR11+2MyDJ2B1w9a7oNEBY1xtwu8/x4maqS7dpbEgVkQC5eM
         UFhCeqm527Xe4xxA+TSinf/z/luOQalAd02IBicgAe3l7dPNqw+R2RCMwsj3i95XGPkV
         qvPQ==
X-Gm-Message-State: APuU4Z+SIf2GOwFIdJHa2/vintUu2HPkBSP/N4Jk4YVw+/IVXwczCRVj
	o9Vk+a+HYPIuepPFQAschr9HMjOkTELRJCgr2gS1y639jyoUB159jJiIhboWd3w+SUA=
X-Gm-Gg: AZFdTZcAfXYh6tVv6b6ejc9NdTEcgICHKb5g9KompNhjIhYpkda+VxETyDXpKp0CmxH
	Ph1Suf5nzptbY3l+Rwn1tPCphgJmdI97RdbuU0z8LiemXdUatSmDAL0sJrNKqB3HxNmrAdTtPse
	trbXwSSxsfH692gvtvR25meT14Ds+jayHv5xBPJmqKUNSLbf98BtiYxqLPQJDLf3WyDXWZonvmr
	IL2iidj9XIHTrzUWEYqxmlfO6mOqfoTO68fEszieFoCzOjDsz8TqOyvL9iss0rIIrKesfxeDh1d
	pjRkb55vgmPuNw0A3qDNTGxSQCcAeogrcnjEOIN4yP9HLHEd+yNgvBojuHlAnLJKcC4WysyZnxV
	mcSy3+ef4RHK+06KF5k+d+jtViuiZNdrRGcVxji1xQwzZ7OVYszBe+s+3fNhCPXRoYOWQmUZFb7
	gX2nMoizSkwNEenlWy1tRlTwzL5Bdzqcs3H4Ux00oucPj2EL3FBPkMGTePJqykEuwmXVK+MHDqf
	S3kSLdKYYZd/G5sFMl1hjZ9HoUWvM79HHuY450SRGv0X9bkQ1wy3ei5H+Z9dcV62a4k7d3T82U+
	Kj73ISv97Dhdna5fhwhokBoMOtrzTphA7oohSP83KqSrlxf/8TVfPsUzeDtNDDc13Okv1aD0yZr
	r6OYEGngQG/nGfcJ+v+iAZC+KlhYXIYzdZiLMjDxcqA9A2nrzr8cpdQdLEjwkpnMfKL9p6TRtrC
	3CcVny8jUR
X-Received: by 2002:a05:600c:4755:b0:4bb:7033:de79 with SMTP id 5b1f17b1804b1-4bb8881dd02mr466627855e9.35.1795730322670;
        Thu, 26 Nov 2026 13:58:42 -0800 (PST)
Received: from iku.example.org ([2a00:23c8:254f:fd01:dae0:ae50:6ba7:39c1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8d4f9aa8sm607535315e9.4.2026.11.26.13.58.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 13:58:42 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH/LOCAL] arm64: renesas: defconfig: Enable MICROSEMI PHY config
Date: Thu, 26 Nov 2026 21:58:39 +0000
Message-ID: <20261126215839.2473086-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.56.1
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

RZ/T2H and RZ/N2H EVKs use MICROSEMI PHY enable the config for it.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/configs/renesas_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/renesas_defconfig b/arch/arm64/configs/renesas_defconfig
index 3ead81d1155e..db392b586e1c 100644
--- a/arch/arm64/configs/renesas_defconfig
+++ b/arch/arm64/configs/renesas_defconfig
@@ -160,6 +160,7 @@ CONFIG_STMMAC_ETH=y
 CONFIG_MARVELL_10G_PHY=y
 CONFIG_MARVELL_88Q2XXX_PHY=y
 CONFIG_MICREL_PHY=y
+CONFIG_MICROSEMI_PHY=y
 CONFIG_REALTEK_PHY=y
 CONFIG_CAN_RCAR=y
 CONFIG_CAN_RCAR_CANFD=y
-- 
2.56.1

