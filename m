Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B72F50E5B0
	for <linux-renesas-soc@vger.kernel.org>; Tue, 29 Sep 2026 12:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790686133; cv=none; b=FJt5JBah4TYEyxk/j4NkyGnk5dOz4CIzxKQ0Aay2U+oieOQFKc5d7ks9c1eB++xum2FRN8BfSarqC3BApI/Mz7j9oD02FQsOIR+jZFondtorFvq+/UQa3GPPBdLJm8WCbNmkm/pdx4+ScZCXC7tnlUWW89UIhHxEW1xuw5ji/8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790686133; c=relaxed/simple;
	bh=76b/ejICPXH46+kgcUnnuIkydq4CVr7Hr6JUbYvKEtc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XMaQinYuqIWW9PPdNAaRhsNh/+naSa9vxbA3r8Rs668zbPHU34u46MOk4UCsz2mfqfg64m4JAQM6TYNTzU5nfNsnzccJEiBJ01wY9nxSPcpvGk1LXvdGNR2o1dbJ9w26Ao3HFU6P5d4DKzGRnVSN9O95/dHVX6YZh7XgY82FvO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kwhPbBiS; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kwhPbBiS"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f63546c5so3720246f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 29 Sep 2026 05:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790686129; x=1791290929; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IMax0i/TU24FZQ1LcLQrF4u9C2CqZ8oMQyiSKx72pIU=;
        b=kwhPbBiSHnXCB+1SH82oEjL6Zb+/D9Ev4YQ3FEeFIilLBmQnfuRzuptoxERqNt4QpP
         ouJz8v36YTAcKsCyI2gU19KOGsSRTsa5j/lUJgdFQlkBpcIJhVlefp3dPDmZ3AfS6mxU
         oB/TS2ZEa7Enpe/OgslCj407a0+jt5R/QWJsO5H72l0SZl1QZ5egsSO46/V99smh1G5S
         nvR9jr7+kdMrR6FAtJ7IrWRT8tBI2ncy94vOiSgcjCv+PdPrBUSI0+4KotAwEXf6Vdf0
         mn2DujAKGNCKCfrT11vU2nlHiT++ohtM3sU150j8apS945JY+GWVSa2qgakdNskfGymK
         HLuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790686129; x=1791290929;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IMax0i/TU24FZQ1LcLQrF4u9C2CqZ8oMQyiSKx72pIU=;
        b=PPadJj9lNAkyF5mvoH0ayDie+04m1aOoZ8kzVi5s2nJ0RaZL2CU5NnUcHQZovFr+sB
         Ml6I1ZlfxzEMeIdwJKmHyH5SwvbQuVSqtHu80sCq0eJj58YPCg+6PtNH/vmV0To0u21j
         7t3aTL9kCWRypOB6aRYoNzacJ2vyVsskxa71IPT88LP3Inf8yqAsPKrRaQYW2imkL8Vo
         IUrSDqK9MT4aepkk9lT8T4OqDs3vVBv6IoLnEwyWmgq3xad+wm9RfeyI0aouv5sI/zLq
         j3n/hsFCAFd8Z4SrfJHUjCW9amev9mduO3OoBEIcDly9gFYOMtmcOBWWbhszisJ9IkTU
         x0xQ==
X-Gm-Message-State: AFuF++m6Mq/V8/3dzpvmVokuKi6EqXel5n8wrXHif6+Sjl6uAJ81CHWy
	umGqmPsKYlY7Jkv/QTbUGUYwF64Gx3fI3engS00v7ZuHtAsNQHrwQPE9
X-Gm-Gg: AYBFou15YVgMRKDNNI56IJSy8/Vh30yF7Mur+5AvsbRqt1m8bVt8IQHJBDFMKoLcIjx
	TZ26sGWRxbF4/ninmh60UxtfVzDqsu1zl9bPSK93aelw0WxfsYCpJlHaslOMXY6lczHE8ualdOe
	s8U9edooBFrQn9xHyZBXbjq8dLABwibudPmouzTCbQ0l7m/k/Yb/eegAlVr/9U5U6DptYzlwRCF
	u/Pwl3O5bXZT506dcSOF2TfN8BHN2j0q4Qp0YP9m6w++V1sJZriUPBVOUgEdXsEdjbA/+aOEbkL
	GQB1ktNANoIVHnmZftKpWZ2eHxM+G6AB7o0T6f0LlfG3W+bEhyK1d1BoB6xnDt4LAWBxr80Dqv+
	Kc2XKr65B9kCnwT3J6a/1PJdf/kU4eWs8KBL+on6XywbaOJhNyIGNMVZYwGNbJhOE7MZ3zazkPv
	15R32ivEYKOr4GuuXY8ioCvUxXsLQn8xHBh4UwSyLhHX3mNRGcF8CVfgtB+w/t9SfI+soJGxI6I
	rjmVNLqnV63Y9xLJ4M63XlWyqmiUBlxrI4OPLFdgVoUaxDjRihy/bWDbQqEEfvvjp3pwucfzEqa
	FwlW6NOp6FQg9HyQxdBRLcLr2LAO
X-Received: by 2002:a05:600c:1d02:b0:49f:fd66:5fe0 with SMTP id 5b1f17b1804b1-49ffd6661a7mr171208455e9.9.1790686129456;
        Tue, 29 Sep 2026 05:48:49 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:be4b:8730:c872:1736])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48af50abad2sm3439942f8f.37.2026.09.29.05.48.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 05:48:49 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/4] Add ADC support for RZ/V2H(P) and RZ/V2N SoCs
Date: Tue, 29 Sep 2026 13:48:25 +0100
Message-ID: <20260929124829.237997-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

This series aims to add ADC support for the RZ/V2H(P) and RZ/V2N SoCs
and enable it on the respective EVKs.

Note this series depends on below:
- https://lore.kernel.org/all/20260929124248.237032-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
- https://lore.kernel.org/all/20260929122407.219448-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

Lad Prabhakar (4):
  arm64: dts: renesas: r9a09g057: Add ADC node
  arm64: dts: renesas: r9a09g056: Add ADC nodes
  arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Enable ADC
  arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Enable ADC

 arch/arm64/boot/dts/renesas/r9a09g056.dtsi    | 144 ++++++++++++++++++
 .../dts/renesas/r9a09g056n48-rzv2n-evk.dts    |  12 ++
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi    |  48 ++++++
 .../dts/renesas/r9a09g057h44-rzv2h-evk.dts    |   4 +
 4 files changed, 208 insertions(+)

-- 
2.55.0

