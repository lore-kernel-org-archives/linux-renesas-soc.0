Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18213E073D
	for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Aug 2026 19:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786994777; cv=none; b=sbvOF/ENjt8DPCp8KvZJ8O5bHVWXDRpzdVFo47rJXjUuhv+6LtnZ2+wB6h94UroE4i3GIPNyfWlcDJvO+yHPfS0quXyHchT2H/V2pULj7Q/DOr9/aOWCvFUtYJTDUYO66h6hcwTF8KtYw1zVsrbxYaBemgJHMMuRCEaWfyyi8QQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786994777; c=relaxed/simple;
	bh=DVgizKVpuB08U7drflvR/Nm9xyLIrxGf4hC+AIIeucU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BobGEoOLkG1dZgl3eGFm61IIUpVaNxsFdBWDDprUTxnDEokgYN57FFRuTAwJ05JXtkLkU9pZEvcRi1WwZoxYtt5krEiX20O7+xSo2g4vzosBZ7tUlsrHhdaCyXG1yb6uf1ijucdvw0uM6VXCeCkZItsYp8LNSroGXLm6msIxNQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SFbx3p/0; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SFbx3p/0"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2cf452def93so2067475ad.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Aug 2026 12:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786994774; x=1787599574; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DnkWDGpHcDpKI6ZJE2YuZxstTmPwSlwlz2aFP0o410o=;
        b=SFbx3p/07jQI0SvdSXIF8yC8RZvRKYnCN/EltB0vMLy0zOhKVdkcMPOSKFVwL42wOm
         qeg5oaifBjh18YwDqcAbTMTYWT1MpUL4C8ERVv47Or8ZoxqQEhPz8PGIQmz/N1IuFG0N
         hLhF7QePDxLD3MAaeZNYWe46xvZzeiIeL9GCRjIrEWXAfj8qUCOYSKdo7QW77SzJhipu
         owSj0zaEoB2btjiEoenyqZ0E1vPYXFMYS56Pb3VPQ8M1JY0cLkAoKnHxLi7ADRuaIWgc
         TiLOGWjObtenPWhM5wjYSOpDZowkwDapb720qZRN7tCYxSWy5FutRjroWTD4ReFozpbi
         cOGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786994774; x=1787599574;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DnkWDGpHcDpKI6ZJE2YuZxstTmPwSlwlz2aFP0o410o=;
        b=hVAerf+66JCT7TX7ub6oXaKys7BQ9r28sZcDXEwkXca7g2un6IztNzQBDtk5HOUN+C
         786V56S5xK3IcokvIB0nwulreOMtl2KlaE2+oR12GagvKMe3RVg7bLHxD57P2ezaEeZQ
         5fsWwP+QtqjGWo/kiLNQHjH2JrhbQ4BVif/xAE4jslsvfMiGKCo6odi9rOhBeShu90MJ
         dy1VlXDaU6Pf+EVEXJxqd6aIyNL/3G6R6PdbqIEJjQ9oo52od0TSpfC2hDj+Crmn89WA
         ZzUjPRizs9MyOBnRfEK1N2yRRKhwsxwS/Iaw8LFx40kY8x7Z5D+a4bhhqI5oHiVHXMkv
         5nvg==
X-Forwarded-Encrypted: i=1; AHgh+RpIIrB9jtxudUxH8/8Wu7MJhh6d1z2XXMpWtgK1FW/iRw4lL/FvijQk8SO7oCf0tTk2BFXJcV3pUm2CIsVmR5yw4w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxz8gnOX1OGcvKfrPwefICb/o5am3FEDM7w2GrNvI6B/G8eajTz
	KkkV1ztHlUPx0wQBHQrLux8OeG20x0/5wvg7BxMHGF+x8YgQz2X+wgSI
X-Gm-Gg: AR+sD13GdVr6DBEvabIzyQrZbc44S16H9DxORLtOH/vm6N3j47K9x6z1VqfjKfVj+Uv
	NXoYadTgCzs0cwZitvoe7DXe7H6ESfco5yGm7aKMITlG205aci384UzwWp4Fw8Yw4WfWXsGwhZ3
	4nAD6fkkDjmiwCvgBaGmtruaHUZiswrDyJFSxKP7ttl/td68ijuMbkXDtMRKqCOYXTZSeIlZsGU
	PPkkxbfuYUd/DzszAkJjOuJ1DhFJeeaOUuBV7kpiyAlKFSQQCMgWxmpcaFnm7dJed2ovcT2MRw1
	qUyb8mH5Sob3AZ4rI9TuTONulR2g3B+lJLesA+PsZw88JzuoQdVIWzqMwWZfQd9eoD6hxbkG0ay
	xhqoKCGbfk0e3Sg4V+U7eLw6yei3QxNlFoMStoCygBvrBr76pmzBxlop0fWPDjX3yoAqULQUZRc
	iuhBj6Q2pYgma1Y6lQdrhz8f/rZxOfbwbAeN8gEYfh5WhFjR37P7HWnC0jN70G3SrRoclPsqpcH
	sfK/hlKXYUiuqch29agwEWvgeQy/8aL9hSRgYS3MbTmpnJE0lCRt2TJBztojMrsgdRCjY+QMAQr
	/kk+pK+lNA==
X-Received: by 2002:a17:903:3bcb:b0:2c0:d94f:50c7 with SMTP id d9443c01a7336-2d5cac820d6mr11280805ad.7.1786994773992;
        Mon, 17 Aug 2026 12:26:13 -0700 (PDT)
Received: from iku.example.org ([2401:4900:1c06:2735:f886:32ae:1e17:ec13])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-326798cb9f5sm10218757eec.13.2026.08.17.12.26.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 12:26:13 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 3/7] arm64: dts: renesas: r9a09g087: Adjust CPG register region sizes
Date: Mon, 17 Aug 2026 20:25:36 +0100
Message-ID: <20260817192540.423994-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260817192540.423994-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260817192540.423994-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Increase the size of both CPG register regions from 64 KiB to 128 KiB.

On the RZ/N2H SoC, the CPG/MSSR block is a multi-function block where,
apart from clock and reset handling, it supports other features including
clock monitoring, write protection, and peripheral configuration registers.
Expand the mapped register regions to cover the entire register space of
this block so these additional features can be utilized.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v3->v4:
- No change

v2->v3:
- new patch
---
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
index d5b3eb6c1736..813bb0cb021c 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
@@ -1078,8 +1078,8 @@ xspi1: spi@801c1000 {
 
 		cpg: clock-controller@80280000 {
 			compatible = "renesas,r9a09g087-cpg-mssr";
-			reg = <0 0x80280000 0 0x10000>,
-			      <0 0x81280000 0 0x10000>;
+			reg = <0 0x80280000 0 0x20000>,
+			      <0 0x81280000 0 0x20000>;
 			clocks = <&extal_clk>;
 			clock-names = "extal";
 			#clock-cells = <2>;
-- 
2.43.0

