Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 968F23EFD39
	for <linux-renesas-soc@vger.kernel.org>; Wed,  6 May 2026 15:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778083108; cv=none; b=PtaEMBbnDWD0MxNspUi0+QZi/SyZdHjxTdZ4vulou36cVBpkJOSw6/iDATcU0EOMt9azQv36AqA+JmjeXNbvWN64GVbNZhX34TKs2U9osGbmGqmwno9l43Vo/pMQARxsR89dwVZKz0fojT078hGK9QjIVvJ0XdWARe1cME46pwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778083108; c=relaxed/simple;
	bh=+BrTZN7WjIkYYV/ZkbjuQoqqC2TZZNd5QHXxfi1b1O8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fJzTH+hYdhUoIH48JyeoTQkRNYVs+uod729SrrkMKfdjqtEx5A01BPtJNDiP9sov9HWtbfhd3HxLkxCKXVvtwdgEALy2YUbtJ/X55+hyMHpw+DZUyGIWEKzHIGWTMDgqFrswyrlQjlrEOcC3ekTKRHI+PbWuM6+YBued0TL9F8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BENxwuWz; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BENxwuWz"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4891e5b9c1fso64133375e9.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 06 May 2026 08:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778083102; x=1778687902; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vdI9Daiia1nMigPzaGMWlZI5mMBjSVg78hSdneCRYEU=;
        b=BENxwuWzcEfVexa+efgsUdenxg2Om4CEtGFbZir8iQKOP4TAU64MU5EZYBKXdyZbtR
         2R3Qm4IJpPbr1T1hw7Qouq2mN6b68v5Vi3dPlJpej8QTPpgfFduteY3PQ1D/XI73k6A9
         1O6r63JlHWbALhzdg2tOZWrdzX0qiDqbYossp2KcethocidwmvK+DvgfwF0eUpzRUXhp
         tfDxA9yoW9Nmt2CAWLuNaLsDUVFTkzmDhJzg+C7vpI7zqa7fHzgx36fmHga7XP207/r6
         JlnszvyWKsbifS/tajTPuIuvQbXZNIWw1PTS49KM6GftpOEayhqnpxEQyvy0khLTJyTi
         zRkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778083102; x=1778687902;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vdI9Daiia1nMigPzaGMWlZI5mMBjSVg78hSdneCRYEU=;
        b=HPXk5TVP3bR5ArU+4F+NsbDeOTtLrh7sYpe4k7QmZf87/0Q4pqS8cvaCeLhmyFmwRV
         1T+pjjwPxDPUR9JCDKrUFLJ7iPIyDLRGtSYPRQhJ2Y6TDW44mAc3pEMt2tTmmTZ8BK+1
         tOK/9CQORKunS8RT9+wyVtR54QnYHQT4evRt7Jkn0177ly3xTH+xVn6dGmLxT8E6/3qG
         s0UR45TJ0XmJBF6GCIAakvS8NuvjAjNBwWGVVzFwuIoummiWvevVgej4zI+rxHfikjh1
         RabHxd926EZt2xEnXItx0EZjFvjyRV/XLmEhfdFfHOF4jo1pvgCaA5AMPtOwlyQQBsST
         0s+Q==
X-Gm-Message-State: AOJu0YwRX3VEFhIRubbTUfFe+qw3zYD44kqoFMpuete2E2H4d9r1UqPr
	PECQ/J1l+Ej34lb2YuZlGyz44ar4TIAMDCqLrpAq8HzGQeCir5MsTFzR
X-Gm-Gg: AeBDiesD1wnqxtYMGgjVivNMdwVVOZx2sbYqoUlv4CDDvy5zm5GR6p4HQLpWVlqL+nI
	IKVPkYFbx3vFx0qiEYD2mFy19dHxfmovYZYaJz94p5FltwVUqRkqRX80/0XGhGdoGMBuggeNcjW
	Cw4j/aUmqF4yJ7qIpTt0JR0nEpuEm+AS6DXLEw8NlO7+3qcFgaGTgKzxHIBBr7Bos9DH559/wnZ
	shfQIcTAHu8N52Ak7tlBDLoV/RIqNTnmw4hyjBjQ1Agr+oxpHBCBdtJ4xt9TQQcCqfkafLhTMPn
	FQ8xV7jOeRyVLMXvTlGK5p4DxrpCbBFIypBGpS0lCHurZeg5R8MZPN81dBCNCTOThPPlbwrJ+xZ
	0uPYuQO8k3arF3u5yratulpaKneELWnSXgAspVjTfbnDXkxdOno74uTFcKBBlGyIcXeHWh9UFEy
	tg5IReg37/j7v/ikL6ODIHkG7HV5bjM3ekrUcFr/5ndphB+fwCrkwHROEHoOsEhAq+87Q4e2FDN
	qSVSe5+4vdUk07jMWj2le14jEKIxSykHHlAxkNbgiYAJy/gvc3XKfHIww==
X-Received: by 2002:a05:600c:a10d:b0:487:12c:e7e1 with SMTP id 5b1f17b1804b1-48e51e1f013mr54008455e9.11.1778083102203;
        Wed, 06 May 2026 08:58:22 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:3dcb:40a8:a5b9:2327])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e530b2039sm21345205e9.5.2026.05.06.08.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 08:58:21 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/2] arm64: dts: renesas: rzv2h/v2n-evk: Add alias for on-SoC RTC
Date: Wed,  6 May 2026 16:58:02 +0100
Message-ID: <20260506155804.3984418-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

The RZ/V2H and RZ/V2N SoCs provide an internal RTC, which is already
enabled in the device tree. The corresponding EVK boards also include
an external RTC integrated in the RAA215300 PMIC.

Add an "rtc0" alias that points to the on-SoC RTC node to ensure stable
and predictable device numbering when both RTCs are present.

Cheers,
Prabhakar

Lad Prabhakar (2):
  arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Add alias for on-SoC RTC
  arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Add alias for on-SoC RTC

 arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts | 1 +
 arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts | 1 +
 2 files changed, 2 insertions(+)

-- 
2.54.0

