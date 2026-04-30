Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2642B3D8138
	for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Apr 2026 10:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777543784; cv=none; b=r/iNouVAbgzO6a7Hq4zblPl/mc90Abf/VpupHu12paoxZcn4xoMDHfw92sO9425Q+729U4jAO1qg0oLKXxu2I9A/4SamHk32/d/GN9bxZO0GEyqekA+NMV8lbA8/UkjXsmcUHDOV7f2At/Zqy0r5R3KGFVW0GotOEOb9aJB8eEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777543784; c=relaxed/simple;
	bh=BDV6z///Ag0jrLfv5FPR55ob2qwhAFZ2RbGtzx56J+g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=id/e7J2LzJ/iSeR3j2F3f6Jdk+55PTXlF5W5HAQigVT1Nl7OpIYBShqeVS/58Qn4okBl0K8eviOgPCwlK33ofZyO5MnJwwhUa8hYmqCaA1856bb7wCJ30chNZ1EkRr8TkVPChDMFF6+bSmEKJX707J5OGkhvPIPGbZK/k8SS7ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=arE6awJw; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="arE6awJw"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48374014a77so8615405e9.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Apr 2026 03:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777543781; x=1778148581; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8A7MIAnU12KGVZkkr1Zar0mlpdikKahBDagAl8oeFpQ=;
        b=arE6awJw2yH6l1bUFQPGLft8webnnCwNgDSv4w51yo1w78K9u+8NY1Pq5CIf1SZMVM
         f4e8hS8I9DtsPZfLv1wx3Xsn99qbicVerDtsIXmwjsXIa/bbOPVNRdqleLOH6+/i3qWP
         nTm+BxONKuY6ln6B0jMnVCPPj8rEcq+Tb6psGeffkE3LFtKt1lhkT716erlhOO0MaOC3
         GycN3+6NnkZXopYXJVAvQAO02LSgIkkWImbWuQhrLatJylLM7RfbByZCZ3DlI3KDwoan
         2XTAODwt0nQSj02S01Wx9BXUDZvKx+uCZpV/m8br10vNdEc1r6J8s0cWbDHW2r3Ko74H
         a8JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777543781; x=1778148581;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8A7MIAnU12KGVZkkr1Zar0mlpdikKahBDagAl8oeFpQ=;
        b=IKBbRsiTwL7QWBMw1sMUfPer4o9pK6EmjTjV6CE6N0ZEfYFHL/QWns4zYjMk3VQKSo
         M58eLmxWtoMNmMZWigrUcB1unfs9pbbmdtuQpVvv14nj2KZyjwUOZC65vulOa773M7jJ
         SbpNH5YEB7uP48Ipodl0bF/nnQv1UzqOc4aHMCHsVi/Fn+QwsJOIQ8EtI275UviOrIrM
         xmUBepwLFeZ87wQOFc1GMRHHsMTB0enCo+DFmFi7VJk6Hf06oPUd8OkOzsOAWuv6OEJ4
         0fhanBIlErwmytU3qV0ZWO0SW/YmxjgHw6Nk9vjB4ndSP+BbTKpPy0gX1uawOZNwYZ/F
         V5ug==
X-Forwarded-Encrypted: i=1; AFNElJ/vdKVnyT8q4zOAn8ufgDK1geVuRd1ah+rcoxcUDmOe5qZd15TBqBoMtlRCOQGV0wE5Ut2VhJcgJfcMj6AQ05jwbg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+iJKK+Hbr9fPibZ5DkowRORH/2/bvSR5geDyK0nx2yvjcdzZt
	JVovecUlALZ0BTSJ5+EhqbzICn3ZfiTjsrO+kesDjbBoKec+lU+eFgR0FDOufY7y
X-Gm-Gg: AeBDiesswxiynY11aZRejG2GopRYUqrV042eLGt754ophKkZZGU0WGi9N5abzm0TIKQ
	ER8KZNMKhvJPYh3dsKtpXRnA0HabOA5Xpep3HS1okZToCjSibS4M2wTnlhDWrBsIcnqMy8kl8PV
	lr2Vr7lpwzAIULJZ39fy1rhZ0FLiod/y6UHvMStj7Cd3WW5eD/n295Y0htljdj4SPwCrRDrj5y3
	P6/ZCxWc52msl0OU1eM+rRxiXTrOnxWpEXYWKWuOpku8GCfKtKSbpOrS7OkjJ3Eol8pwDKEO4jI
	IuqOedz5tTqCZg9VF1worVvVct8OqBBflE9182/U/TFQnond9aWrKWPO0VjPAq0jmpu/j/RmKQl
	RGdL8g7I8R/82ozKpch2ZW+ehjYkUdZcodZjdMUJeofpUFXlyN7tlkMWiK0pgUPXN3J1yoQLKY2
	gpo9ZkGjR4aI/0LuTYvh7j6B2+pWgCanGwxBJz1lIJmzcibXnSccTJJ72fnTdgIyO4viRIciL3d
	PmNTBMdDtXe1LNI2GqS28m9mDzjE9smqfLHZz/qQ7p8AfYvp78B9kradA==
X-Received: by 2002:a05:600c:6285:b0:483:709e:f238 with SMTP id 5b1f17b1804b1-48a84486f35mr40572135e9.29.1777543781304;
        Thu, 30 Apr 2026 03:09:41 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:182e:1592:d4cf:18a0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7b9313c9sm40252315e9.11.2026.04.30.03.09.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 03:09:40 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/3] Add VSP and FCPVD support for RZ/T2H and RZ/N2H SoCs
Date: Thu, 30 Apr 2026 11:09:26 +0100
Message-ID: <20260430100929.1088281-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

This patch series adds support for the VSP and FCPVD blocks present on the
RZ/T2H and RZ/N2H SoCs. The VSP implementation on these SoCs is identical
to that found on the RZ/G2L SoC, while the FCPVD implementation
matches that found on the RZ/G2L family.

Note patches apply on top of [0].
[0] https://gitlab.freedesktop.org/linux-media/users/pinchartl/-/tree/next-media-renesas-20260430?ref_type=tags

Cheers,
Prabhakar

Lad Prabhakar (3):
  media: dt-bindings: media: renesas,fcp: Document RZ/T2H and RZ/N2H
    SoCs
  media: dt-bindings: media: renesas,vsp1: Document RZ/T2H and RZ/N2H
    SoCs
  media: renesas: vsp1: Make reset control optional to support platforms
    without a reset line

 .../devicetree/bindings/media/renesas,fcp.yaml | 18 +++++++++++++++++-
 .../bindings/media/renesas,vsp1.yaml           | 17 ++++++++++++++++-
 drivers/media/platform/renesas/vsp1/vsp1_drv.c |  2 +-
 3 files changed, 34 insertions(+), 3 deletions(-)

-- 
2.54.0

