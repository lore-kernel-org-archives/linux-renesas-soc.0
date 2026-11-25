Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795608914;
	b=kNRcoTPTyqQNTqU9gKHMzKP1OD520j8VkKUoYWFRCz7/hSH24n+JtgN7UYzR+GzGvaSM
	 0J3dJ04lBv8JSsYqsuQmxuC58Ds2cZKZc6iNTZoaY2Z6o25jXFbm1+DiPLEmfGEOVHMnl
	 yH3LIqmCX1HYRdK54J5U5DbVBg25BkU1TFgBXFHw0+Xk+LTadVlDiFn6ynBbLcKU/QT9n
	 lLkRfyrif2WBSmT2aRLryMw59undnb2ek0yc/i843v6TAv+Z4C8QRTZX5Phn5gtUq49kg
	 w5afeh9wU1JuiVUP4wx/HVn/XAj4ix9GnwzrtW1VZmdy1aZ6TxKrRHzEgmmhXomeIFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795608914;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=gnAyztqeUe/q2s/7Qp3n11tSLiy4Es8dTJJvQH+qV7E=;
	b=21+kGkF4++Zuwi0qfJaonAFIkW6nnnqwNeH3F0QfjRkA2uV6qVDoYmlKHh67/Whr6nYA
	 e/J1YPilgcMhLBVBxZ2ePDFRlzTSrzKUmV7QPt9+q0nL8zboT5hQjRLkzVq4Zy1bDuQPd
	 X1QNM030GyCbpi+MEtggwxBghB3pox59WEwAudb+LIEj+Ijcikt+YX3ImGdr2PWIS5ouR
	 /cu2BwX0RlJ7g9QwA4h4Ya1MF/GZIVlcHKIUanZKjss1inMtYzvIOJMfDm8dIbOsZZVsc
	 cfgGTVPGyUZcVw8tT8YvDjgf/Ep10euf/gyvnq3f1M3cMarewvvZZuW4/4Jz9sm/jzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OGa7dvPE;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C5D606A338
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Nov 2026 12:15:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79C5D606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OGa7dvPE
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4bb666304fdso59046715e9.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Nov 2026 04:15:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795608913; x=1796213713; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gnAyztqeUe/q2s/7Qp3n11tSLiy4Es8dTJJvQH+qV7E=;
        b=OGa7dvPEcUwsHNXtYUoGb5csdZNba1XA4zumnNZh06ibecuGQsUiPrVaTNcYau341P
         8kiTizoQMMjG4uULZ2ITIH9P+avli2cb6RMjd9ISrSh3aoTTRZ95AUep94FmjgI6MX+v
         uuxj97fF8UoDueuXcFER3U0meCugoKJWPa89KKtGjR0jqFFCNqq/W/zNSYsMjs+C7Uuk
         odIdVKwhKxIBnNBxS1Rl3lZZllUpRaSMaM+AuNxxJYuUI3dAgM5hGCMAKrhHzKlX9ax2
         KRq1hJqBzAYXACMELDoYwfYZQMjYHm14hw6TaLxwxtHzKW5+x7hLmP46Z+rI1eKilNzH
         F/PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795608913; x=1796213713;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gnAyztqeUe/q2s/7Qp3n11tSLiy4Es8dTJJvQH+qV7E=;
        b=nuBAk+h6uWfxKNHxlIQZnbMEj8VvgKSjNrB+jpGlb7vS8SLuHwUxd02yMI577YESQz
         SZ/g3KLF3ofU1tI+70Nk6N8vLJoi8Nqmgjc/0cpy8ZU1o23IUgQq1ofB+MMjG12YHa3T
         7hI0jkHs5mp9Djgm+xfMQMRyUCDxNWNd1H15t2nYbscj5aag3KHUF1+fraevrQt5YfcK
         szf1oVTWDlC7qy2Uf6B+FVwA1XTFf0rbGNVRil8kVW66mLRRDDt/kUYNLGj3hDOhixRM
         r6EVwjQBq93+XI3opCAXAmlEv866tBs86JehSHxE+iDP/r3qEqusZfoRo09SkpjzFAJE
         HDTw==
X-Gm-Message-State: APuU4Z+kCb+KPx+oKkYwvpVlHzldLZnt/gkP+Q3Jpn5S7D5axA9m8P2J
	HoVKIR/hYWQhBT6Y/4vz/OG5LeAKoAd2WiyNtPBEo+05IvywTTp8oKmT
X-Gm-Gg: AZFdTZcRywb3fI8/ZBzHhN5m/BVEuyZqTJvJt8CzSIzk23HXLIYZ2NvLDGribuH20oU
	uSh8Qv9/jY2p8+Bo7XGOH8quUNCibCYhpuFl6oWXYBDd9ub/mx+HHPMIczMsLGy8VjttHFzw2ca
	mhaeuXjCR1loa2CGRXDGPX5hOddpDwIhFvzZFBmQ/zKqFHomU1G1vZvv3AllGYV8OmPbrV5BWVG
	DWMRDy/IGXU9AifFm4xA1WPv0wfcZRuwJTXTW/T0foFRElDlePbg+GUmkySchEPPTg4KSX0bb3z
	PbgvxjpOhpp4laMPdMnit5+PCnOdAVJ8m9WKddOBkphIy8hqi733jdEvu+49vH00f8SX0368RDv
	aDcI+cmi0FB0Nq/8nWNOKLOU/PsKZ6E074rZb2VfuQh+7QWlaUbpbrLDQJsnil6jomkcHKKqIKS
	Gk1Dp3em27Kkc0ICr6r68PEhLWqN+sSuSt8zWOHZH4H90Koqg42WKGzaOgwUesPZNTNwcEmqAtv
	q5Qii6bdcwkVNPMOwlQyzBXA0rA6heBCBhpxCxy7DmIFLeERjXzn6/7OTiv+nKSIbAL/pHzkdQD
	075TxnijLKKfzEqnjkFGnjOpKCl2TTR4x5kFwbjsqLdWIvWMkdASim5GgKiIm2ttNKi43HvTiBN
	ytyfamAySRRP4/9kURDedzAu+kMNTum591sYeavxIvUmOth11drv5qsnCRjHf/t9ZuXxjKIJqRZ
	PIW0W2CV2HxWidyd1wXxaanV2BRSlAjQ==
X-Received: by 2002:a05:600c:37c6:b0:4a1:88df:8a2a with SMTP id 5b1f17b1804b1-4bb88812a84mr355620345e9.13.1795608912826;
        Wed, 25 Nov 2026 04:15:12 -0800 (PST)
Received: from iku.example.org ([2a00:23c8:254f:fd01:293b:cca7:e6a9:dea6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b09bsm947626355e9.4.2026.11.25.04.15.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 04:15:12 -0800 (PST)
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
Subject: [PATCH 5/6] arm64: dts: renesas: r9a09g077: Drop GBETH filter properties
Date: Wed, 25 Nov 2026 12:14:47 +0000
Message-ID: <20261125121448.180847-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Both 'snps,perfect-filter-entries' and 'snps,multicast-filter-bins' are
discoverable from the MAC hardware feature registers of the GMAC IPs on
RZ/T2H. The stmmac driver does not parse these properties for
"snps,dwmac-5.20", and derives the number of perfect filter entries and
hash table bins from the hardware feature registers instead.

Drop the redundant properties. No functional change.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
index 674e35e4f242..1be6a7ff08aa 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
@@ -567,8 +567,6 @@ gmac0: ethernet@80100000 {
 			resets = <&cpg 400>, <&cpg 401>;
 			reset-names = "stmmaceth", "ahb";
 			power-domains = <&cpg>;
-			snps,multicast-filter-bins = <256>;
-			snps,perfect-filter-entries = <32>;
 			rx-fifo-depth = <8192>;
 			tx-fifo-depth = <8192>;
 			snps,fixed-burst;
@@ -722,8 +720,6 @@ gmac1: ethernet@92000000 {
 			resets = <&cpg 416>, <&cpg 417>;
 			reset-names = "stmmaceth", "ahb";
 			power-domains = <&cpg>;
-			snps,multicast-filter-bins = <256>;
-			snps,perfect-filter-entries = <32>;
 			rx-fifo-depth = <8192>;
 			tx-fifo-depth = <8192>;
 			snps,fixed-burst;
@@ -877,8 +873,6 @@ gmac2: ethernet@92010000 {
 			resets = <&cpg 418>, <&cpg 419>;
 			reset-names = "stmmaceth", "ahb";
 			power-domains = <&cpg>;
-			snps,multicast-filter-bins = <256>;
-			snps,perfect-filter-entries = <32>;
 			rx-fifo-depth = <8192>;
 			tx-fifo-depth = <8192>;
 			snps,fixed-burst;
-- 
2.56.1

