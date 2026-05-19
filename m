Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB75A3DCDAE
	for <linux-renesas-soc@vger.kernel.org>; Tue, 19 May 2026 07:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779176846; cv=none; b=Qotr5VOzV8q1K0IF8t9FWDr/zeu/W0qjiMH8PhaVxaOJsmjqmPmBLLetsqpFL13AvPQROYJPFmbRoAW+a/sHL513Cun7Ofzcz21nBfwjZGwuv6PQ8gDpIcBdYLTJIao3Yx6RN6hRYJiarpxQ12PszPg/cqkw0OpvcQ77Mcskia8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779176846; c=relaxed/simple;
	bh=Es658tDUhANj0f65HggskjZBi7myAITa1mQQ3XfnQ7k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EbdJ6q8Gc+Atm0PrbuB+YT0Z6xhf03O3W9lgaufRMfwVnyCtgq5eaiJvwJ5QFTcnmlNMdtTF6xso7rNQP1ZNGEuZfe8qM4qwaDh20tiADT1FwkXA9W0f1r0P38pR7vzZgNGOpnOIC7fxEkNyWBT4QMeU+t/+gl40fCW3Bg+/dmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Vzag1gZm; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Vzag1gZm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=srNJzadSlYth5E
	K7RTZS50LIHoTspbgGwB8oo2XUbM0=; b=Vzag1gZminY87pBKXNWF21D2DuLBMg
	e8WtpP3ur4/E6j6Fl4khJB/ahtS3i1DcBp1DomtzJ9dI5lj+vKw/wsiewJvnNWk7
	wSlNnc2WyHxqYqv72SrjAfRHUtVLgvfzA5D0fjtNllWSzLiYiO45uEXl81wBxMbA
	r7PwvoKVVCU6HgUr/vrmhg+QfIWRx4ouyt3EwDvFT4wJ/5eDZBCtgrFJq28A5qOG
	1EFgXRFSBWq7WhWzzKU/7b6zE4lo5HRJnlO53rbsplYswiFh2WSeURDLhTqYwAUX
	6OXifaUzwb8wjSKdvJpx6WMBnQWgtvL4Ltx9qjupuGRZ5SCR4hPz6NjQ==
Received: (qmail 167933 invoked from network); 19 May 2026 09:47:12 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 May 2026 09:47:12 +0200
X-UD-Smtp-Session: l3s3148p1@PW8R4yZSGLhUszca
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v2 0/2] arm64: renesas: r8a78000-ironhide: enable SCMI
Date: Tue, 19 May 2026 09:47:02 +0200
Message-ID: <20260519074702.3308-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Here are the DT additions which allow the Renesas R-Car Gen5 board
Ironhide to handle clocks via the SCP through SCMI. For that, we enable
MFIS controllers, STCM transport nodes, and finally, SCMI. Needs the
MFIS driver which is currently in -next.


Changes since (internal) v1:
* improved comment about transport nodes in patch 1
* fixed abbreviation typo in commit message in patch 2 (Thanks, Marek!)

Kuninori Morimoto (2):
  arm64: renesas: r8a78000: add MFIS, MFIS SCP and transport nodes
  arm64: renesas: r8a78000-ironhide: enable to use SCMI

 .../boot/dts/renesas/r8a78000-ironhide.dts    |  34 +++++
 arch/arm64/boot/dts/renesas/r8a78000.dtsi     | 129 +++++++++++++++++-
 2 files changed, 160 insertions(+), 3 deletions(-)

-- 
2.51.0

