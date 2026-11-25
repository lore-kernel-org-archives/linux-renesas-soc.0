Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795608912;
	b=y7h7mBGIVPj6VkYB6mn/1NM+gdcVggQcC5UytgEtr3os4ByoT1E6uYIQyWg+43yrq+Pt
	 nsvWEbzF4rSSffBrp7uS7DU+btrfKpLq+1q3GEn3dMqXCdWUokPy5zNjcnP7YCrbtwhKJ
	 UDCMRP7RspewPcdyDA4iqOayY9h8cFjIThXaLUaEQwwE+/YxxY7uql9q9Vi5bt9Lc//sR
	 CkkVbmL6eF0cG5BLTQyDv3YFJsasGgPtUdS2oSZzn7Jjfny0SUUsEANmssqI/r4jFz5lQ
	 Xq7tRh0zxvWSla5y9pIJi+QbRfwoeJ34cTl7KWSnPjLAqqTrgit9ZmUPJtkL3CmqpSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795608912;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=TFj1PLZZtoWbVRq955IZXwqJyuyzYFFvoCl1bDOikmw=;
	b=1M9ejw/TsA/aV84Ap0llb5ENrb7bg5+1UdZTTV1qP/SfD2VKEzKQZZtFcnNLkPeFoa39
	 56W0ckLZAVpzlJ2lB6vML8b33SDkRWp5JUQZbsyRFdp3yxqNcvhfx/TWl3TGYU/nFmP8w
	 n1yXrw9lkgD2C9cdMStx2vkW9lc6Ju32w1QylFlg0IEmuBlnT3J3aFuLQwEGREf6OJgPg
	 usfainF1gX39P4X6rmTykznqIRQjvWVqfbqk4xvVgH/LN8tciYyDFbXT18aBnvQN1XWN4
	 D27xAVPMxWWOflHKg7SX2WRdIb78ZAxrZGREH+75OZyGBgTlk/2EyLyZIGo8cJYGWHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZUpUXWoC;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D9B0606A33F
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Nov 2026 12:15:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D9B0606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZUpUXWoC
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4bb6057b333so26819105e9.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Nov 2026 04:15:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795608910; x=1796213710; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TFj1PLZZtoWbVRq955IZXwqJyuyzYFFvoCl1bDOikmw=;
        b=ZUpUXWoCPYTM6Grx7JkNR2uPrIqVqbUhQFfyvbv/Gw6iEwIM2sC08bQU0y4P18cd5x
         thnFC12SScFugeE2QXzdoPQivUWSfmCdCCxym/QtQ9ZS9W1vesmDm77kKYSwv+3YKTps
         1/HelArEvMB4FIi//KRuSxpa0Gj0MUWIAGBR/lkNU3PlMgfAty5lGZOx2LQ4EVI0NzHV
         twJxziyxK2OP341/LsWoSKDtGR2ylSjPao2vhRdtzSNZYtR1KI4YukVXrFfxC0SuwSQO
         ujLI73mZFgzZkzACnClcEGmgSpJhhhejgsOZXM6lJbWGEZ4GMLJ3bzVv6hf3yj/Aj/z9
         nBNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795608910; x=1796213710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TFj1PLZZtoWbVRq955IZXwqJyuyzYFFvoCl1bDOikmw=;
        b=bHc1UdQGwCvxBU7wBdyHFHZbTrXUk+BQAsDL5QCuWdZw5Ml9yq4IWfQ1/JJVKzNkPF
         YclT3cu1LYpCEY0yK3Scqr/4e6IATaWob/GV51vDy76HNdBKUHKCXOGCizDbvWdpd+OG
         LsdVL2Y/lPLhQL6MepZMXfqWNVFmlYMdgxfxKRMK6dU4CvtHXo4YEKDybxY9u2FEcrN8
         K0BTWLCacWatauHd5fBu+27bZc5rjv2qc4IERWcY5ebdObuh2PcsqQSdpnmD2oAhiovb
         P1rUAepyP8GxzULm2U99a9Po2P1w6IquOHZB/D9qMr0uug0F3EdgJ4W+mTcbMqL8xcai
         MYQw==
X-Gm-Message-State: APuU4Z9rnwSQ5VKXMnyxUU+1ef0oA+2+mSYgn0eRZ2yWePpWL/4zvqTt
	PLMaKfDU1ZINOuRsWD2x++WCtjK2WWSRp+ZcHy/XkThhn2i8TkVNSo/+
X-Gm-Gg: AZFdTZdlOKmUI8NfQuwl2whvSlITZ9ngnWplpGGB8rcVv6A4YthcTkSuyE6wec7IC/2
	wYVh0xMu3zjVRVD22uDCIrCTr6TtqvVWw2e3YScBuYrZPje98Rkj7JAxXuxVqx9E5fyaSnZrGoZ
	f833IZ2LLLER/LCo9l8kGT72/+BPyLBABA5xaPy2W3ECvLKF3KLdfJYONSUuckpppeapLtjMdzs
	4q4DIkBXyke44ptWresQQNLtRyk6uIQoH/KGjkMNFa2qv8eFSD5Q54yHBLUh+EzFM8udbQsnaub
	zu/ViHg4MuBeqoVzM6CHbBUD+rnd7/PtG34rYmnY4s0sJshdpVKWocJUzBOeOnwWo1xCMmk4chA
	3qwFZFWTD/YU7FG5IeKuR5Q/mrKGyoEZntn/Um9RB4i7Qe38hygqXuNLwdk/shTJAb1MeTVxJlk
	XOsXt0oWLLIP/RPvH1ojsqs4+6p8Zev7qQTzEBEjoUs+4VCxmk7m9LMmswPx7W8sVCp+Ej0Zwzn
	SIKd7tXvmQ0iWRXnjMUsPbiDaBeJTy67Ww7eDlvIlZX5uJMFaYJCm2wwwtpw8oIHvbYj0BQahQ6
	LkfXeBP2dkVCeRpXPnMco+xgu1nctHagKONhZF7iEHMgmN8mRkziYRaogAIj+FRvD+be4i8AnJt
	ggA/0HrQZ4gxythc91LCp92gKeeNbgPAjzpgLJqqBRuz5+tGlOLfnGjDc5o024EtrN1k/MmpNtE
	gjgHAsfSrr
X-Received: by 2002:a05:600d:18:b0:4bb:9001:1aa with SMTP id 5b1f17b1804b1-4bb900102b8mr243378915e9.10.1795608909690;
        Wed, 25 Nov 2026 04:15:09 -0800 (PST)
Received: from iku.example.org ([2a00:23c8:254f:fd01:293b:cca7:e6a9:dea6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b09bsm947626355e9.4.2026.11.25.04.15.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 04:15:09 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 1/6] arm64: dts: renesas: r9a09g047: Drop GBETH filter properties
Date: Wed, 25 Nov 2026 12:14:43 +0000
Message-ID: <20261125121448.180847-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125121448.180847-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261125121448.180847-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

The GBETH nodes on RZ/G3E specify 'snps,perfect-filter-entries = <128>',
but the IP provides only 32 perfect filter entries.

Both 'snps,perfect-filter-entries' and 'snps,multicast-filter-bins' are
discoverable from the MAC hardware feature registers. The stmmac driver
does not parse these properties for "snps,dwmac-5.20", and derives the
number of perfect filter entries and hash table bins from the hardware
feature registers instead.

Drop both properties instead of correcting the value. There is no
functional change for Linux.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
Since the driver derives them I havent added a fixes tag, in case we need
one below is the tag which needs to be added:
Fixes: 41ffbb1c42d3 ("arm64: dts: renesas: r9a09g047: Add GBETH nodes")
---
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
index 737bf1c60451..fdedcfce8e9e 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
@@ -1987,8 +1987,6 @@ eth0: ethernet@15c30000 {
 					  "tx-queue-2", "tx-queue-3";
 			resets = <&cpg 0xb0>;
 			power-domains = <&cpg>;
-			snps,multicast-filter-bins = <256>;
-			snps,perfect-filter-entries = <128>;
 			rx-fifo-depth = <8192>;
 			tx-fifo-depth = <8192>;
 			snps,mixed-burst;
@@ -2092,8 +2090,6 @@ eth1: ethernet@15c40000 {
 					  "tx-queue-2", "tx-queue-3";
 			resets = <&cpg 0xb1>;
 			power-domains = <&cpg>;
-			snps,multicast-filter-bins = <256>;
-			snps,perfect-filter-entries = <128>;
 			rx-fifo-depth = <8192>;
 			tx-fifo-depth = <8192>;
 			snps,mixed-burst;
-- 
2.56.1

