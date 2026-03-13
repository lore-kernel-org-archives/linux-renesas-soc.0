Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA5B9331215;
	Fri, 13 Mar 2026 11:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773400389; cv=none; b=ieVfjdYbFygxg4hd9rDAxu3Omg2V9k082Du4ZCEDaPrja01LH0zWFcWH1GYDwZC6kB7YSTRU+6lXaRvKEkdcULLV75kFvr1MpoV8Ylv3Ta7mLQPMfK3tZA7naM2sEi6qNVPFb5UquXot6wCmVu38oVvctwzOPtvFFc/Dcs9vj5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773400389; c=relaxed/simple;
	bh=hl155Ee8o1RRbiomHR7MLXMwgivdiV9kn41X1Kg9lmA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KmZ6ypNFBz2r9keQMbUgYu5vtbFQC6qi6gEmgZS4J6XkerJnoedfKU62lHcd+WpQ5G/FU8ZWPcDaiQCBCJlXWStI4qWqsmHhutBwaWzhDBetx2Dk3T+r9bK4a7htp3VgeOgHVPJpU3zPgJw7mhRhT01RBM9bGe6hi17ygD/gSwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F524C4AF0D;
	Fri, 13 Mar 2026 11:13:07 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 3/4] Renesas DT binding updates for v7.1
Date: Fri, 13 Mar 2026 12:12:59 +0100
Message-ID: <cover.1773399673.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1773399669.git.geert+renesas@glider.be>
References: <cover.1773399669.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dt-bindings-for-v7.1-tag1

for you to fetch changes up to 3ac4e6b92fc200e047d13aae06224b2a72539b9e:

  dt-bindings: soc: renesas: renesas,rzg2l-sysc: Document RZ/G3L SoC (2026-03-06 13:38:54 +0100)

----------------------------------------------------------------
Renesas DT binding updates for v7.1

  - Document RZ/G3L SoC variants, the RZ/G3L SYSC block, and RZ/G3L
    SMARC SoM and Carrier-II EVK boards.

----------------------------------------------------------------
Biju Das (2):
      dt-bindings: soc: renesas: Document RZ/G3L SoC variants, SMARC SoM and Carrier-II EVK
      dt-bindings: soc: renesas: renesas,rzg2l-sysc: Document RZ/G3L SoC

 .../devicetree/bindings/soc/renesas/renesas,rzg2l-sysc.yaml |  1 +
 Documentation/devicetree/bindings/soc/renesas/renesas.yaml  | 13 +++++++++++++
 2 files changed, 14 insertions(+)
