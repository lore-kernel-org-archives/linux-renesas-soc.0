Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD713A784E
	for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Aug 2026 07:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787558396; cv=none; b=YzPTj7Ddcm0uVLkeoiZ9G8KW0Qw2+qtkIBwxj9c1rq1RhEXIW4/iJa1pX8Pt7biJEOU9acIoPJ6/J50BnT24o9dLvIQ16OswDysXIejBoqhzQMZ7N7ss40FxIJSIeMrHBNro/VQg8S07E+oQEwqy1J2FHhZMQgXjE8KdBA936Ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787558396; c=relaxed/simple;
	bh=rp+33HlvXdrR4jBpnqFXAKUnjS3azU+CWF15NRzI6tw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=miPk0uuZK5isDPHth1OcdUZFs+z/cZpith4X5sGhnzkeJGRcjtUzlg4yup/EC+ZdE6Ff1YRXr4U1s5XDUlg+DlizwcYTfes4w0UJmLXDYno1ZTP2bsWLQ7bCyN+ZYGPLKRmLZ2ltOopI9B+ZA++Cu2O0ZUdCMP1X6d7xNFXbbl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=miK2ZSys; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="miK2ZSys"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2d58efc7356so35190325ad.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Aug 2026 00:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787558390; x=1788163190; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qhpulUp5XMYUwS8wo27AeeCJj0S9L2O5+74wjdVfnOk=;
        b=miK2ZSysGOuua+vwY/NDxgY2RH5ya/I4PhQAcUHQ6jTYpyh4yBfXIOGtpVKpkut6yw
         Fk1b49dDO8xl2iTQc/dIrKjrExvI90497OEfPlzSMD+yVLnOt11rjjEcwiz/IIYchkXk
         Q2qZSCMaUWp8HrFIrKLJmJ2WwPVNO9SyxvPP8dfn9t/e7ScCqzdGwH5uqidAihLt39wK
         rvPm+NTHkw2IwXvzo1ZYqfj0vnyrSxl93j+AotbE1EB5tDH0gFSi6N71Bb/JB51ZzFyc
         VoFBphPDcs67smOPjLTxWW+OuuFmX4pGlZZIEFPLFyyFJcyAuI2i+SntOXmSypkMh430
         hRFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787558390; x=1788163190;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qhpulUp5XMYUwS8wo27AeeCJj0S9L2O5+74wjdVfnOk=;
        b=P0SHlLXxisBV+m9ez1fG0ZUG1XB2K49W/evWQ5F1hqT6ygFWNxzJLjArrvCdI1+GvH
         OgBJEU+QI+oqXwLI1Uif6d5LRiS4Kt6KinRalHOPJAC2mN6dMKDtfyCLDYDnaz/xG7TV
         Skn5aVx0/6gXDtNYutgsPtMv/vLV56iP95TePiMXc763ivrir0NSiU+PGB8U9/d6fPfq
         Ln2V74JYND9+qU+Uz1klog20jv6f2h/C7/Q0bp7SwcLzQ62YOX6dLXeYLuokMvaLV7sQ
         yF8SCD4DtiL0IM08JG4gA9nHUUevmRhER4WeyEQ+4QVGXf9fCskO9vWMIKW5InsKnYsA
         4M/Q==
X-Gm-Message-State: AFuF++nIWfhgu3Wkh8fWavtto/MHt0S0GHkVdbncvmABVEXpSrdhC1pq
	7k/rK9wG6eFXzCmIeDj5kobttthEX7nJ8z81KSoKg7b4RwG6+kGhtAyl
X-Gm-Gg: AR+sD12iF12wUaPa+hOWaojyEvX1lPYgDL365CNxKlpQrbMMpMnVukyL6BBFH3Z5baE
	XVWxIhGTgxFnvKzMrO1N7I2LsUBj0gsirFzCVzTs9uz9d3v6ifaj5xjZtS8G709IRLupY9pt7a0
	YaFR9v4QldGpD58/3pDq2UTsDcfcSFU0rhWqPqxUZSl7DOOgMuTwMDplUE7cJDXpS398yhGSre3
	eykJDAfCefJ9Y8N7NMyhMWfL6O5Mvfeu5bBinZvcIYvekOn646EkmcmwDoxFW++AhewGwxegtc9
	Zu1odVaa+q5mvSmPg6HnL74rPfMO2ks28rhqawqkZudOx376jt5DCILkKkE6pEKz2Yt/DJoeb/2
	QDO7xhTgI1psQi2SEoKv1eeo/SrASHNZBrEBvMvSWUdKEoQl18Qh2rVNdWy+IVYxN+04mIWHsII
	MSToWF7/RMnYiPy5Ig7GCuoXvvfHJLemhzBqQiZ1sqBttWqJ8n6OSsprTpVssO7ofybs98MZVDh
	FvevwLNNLxiIKMTSMhDLCUp0wcwWfwTTvSczfMvQ3uM4sAptOHHNsW41hTOEWNIuUUnTYlra5w4
	BKZk115I
X-Received: by 2002:a17:903:1585:b0:2c8:248a:5dbb with SMTP id d9443c01a7336-2d670bf23e4mr287219305ad.7.1787558389563;
        Mon, 24 Aug 2026 00:59:49 -0700 (PDT)
Received: from iku.. ([2401:4900:1c07:194c:fabc:2511:c0a8:be1e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f91d2d1esm24887994eec.17.2026.08.24.00.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 00:59:48 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/3] Enable RTC support on RZ/T2H and RZ/N2H SoCs
Date: Mon, 24 Aug 2026 08:59:33 +0100
Message-ID: <20260824075936.2904336-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

This patch series adds RTC support for Renesas RZ/T2H and RZ/N2H SoCs and
enables support for it on the EVKs.

Note:
1. The patches apply on top of renesas-devel/renesas-dts-for-v7.4 branch.
2. The RTC driver patches have been queued up in the RTC maintainers tree.

Cheers,
Prabhakar

Lad Prabhakar (3):
  arm64: dts: renesas: r9a09g077: Add RTC node
  arm64: dts: renesas: r9a09g087: Add RTC node
  arm64: dts: renesas: rzt2h-n2h-evk: Enable RTC support

 arch/arm64/boot/dts/renesas/r9a09g077.dtsi          | 13 +++++++++++++
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi          | 13 +++++++++++++
 .../boot/dts/renesas/rzt2h-n2h-evk-common.dtsi      |  5 +++++
 3 files changed, 31 insertions(+)

-- 
2.43.0

