Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C337A282FC;
	Thu, 22 Aug 2024 16:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724343812; cv=none; b=KJ0Dah9XxyOZt/tYtDDDN2rMzmntlA54SUdSGL4y6lro05EY+OqNQElbpO9adEnfiiFKxwTjJnMM1Cu24uy6jv4QVjfgj9Pn6PqNIYHYBm5oGaBxdpBOtUZqYjklJmG2BtR7greeycvCphBDkKtykbcevPLfbU1jTwIOu1zGieI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724343812; c=relaxed/simple;
	bh=lcFmbUPx2tkQ/EAlCHVuMsSc00wtfebwPvgI7oOZSvw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=d8toac1hi4S7vc86vL6v/UvwMo+x1M7P1LC66xsmqEqon1aSoYpY/eYtueuocA+dWnBiXwxCqxLLfrWgQRkwpRXUiq6B0J7aGUTElw/q4XYWsD5F65mUXcGXyPIeg6mMv22UFkFISYsuGb7sf6orxyU3e3MEqODJY9MqXoioEBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.10,167,1719846000"; 
   d="scan'208";a="220284611"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 23 Aug 2024 01:23:28 +0900
Received: from localhost.localdomain (unknown [10.226.92.15])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 403FC4007CF2;
	Fri, 23 Aug 2024 01:23:23 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v4 0/4] Add support for RZ/G2UL Display Unit
Date: Thu, 22 Aug 2024 17:23:13 +0100
Message-ID: <20240822162320.5084-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series aims to add support for RZ/G2UL DU.

The LCD controller is composed of Frame Compression Processor (FCPVD),
Video Signal Processor (VSPD), and Display Unit (DU).

The output of LCDC is connected display parallel interface (DPI) and
supports a maximum resolution of WXGA along with 2 RPFs to support the
blending of two picture layers and raster operations (ROPs)

It is similar to LCDC IP on RZ/G2L SoCs, but does not have DSI interface.

v3->v4:
 * Restored the ports property for RZ/G2UL and described port@0 for the
   DPI interface in bindings patch.
 * Restored tags from Geert and Conor as the change is trivial
   (Replaced port 1->0 from v2).
 * Used "&" instead of "==" in rzg2l_du_start_stop() for scalability.
 * Restored port variable in struct rzg2l_du_output_routing
 * Updated rzg2l_du_encoders_init() to handle port based on hardware indices.
 * Restored ports property in du node and used port@0 for connected
   DPI interface.
v2->v3:
 * Split patch series based on subsystem from DU patch series [1].
 * Replaced ports->port property for RZ/G2UL as it supports only DPI
   and retained ports property for RZ/{G2L,V2L} as it supports both DSI
   and DPI output interface.
 * Added missing blank line before example.
 * Dropped tags from Conor and Geert as there are new changes in bindings
 * Avoided the line break in rzg2l_du_start_stop() for rstate.
 * Replaced port->du_output in  struct rzg2l_du_output_routing and
   dropped using the port number to indicate the output type in
   rzg2l_du_encoders_init().
 * Updated rzg2l_du_r9a07g043u_info and rzg2l_du_r9a07g044_info.

 [1] https://lore.kernel.org/all/20240709135152.185042-1-biju.das.jz@bp.renesas.com/
v1->v2:
 * Updated cover letter header "DU IP->Display Unit".
 * Updated commit description related to non ABI breakage for patch#3.
 * Added Ack from Conor for binding patches.

Biju Das (4):
  dt-bindings: display: renesas,rzg2l-du: Document RZ/G2UL DU bindings
  drm: renesas: rz-du: Add RZ/G2UL DU Support
  arm64: dts: renesas: r9a07g043u: Add DU node
  arm64: dts: renesas: r9a07g043u11-smarc: Enable DU

 .../bindings/display/renesas,rzg2l-du.yaml    |  32 ++++-
 arch/arm64/boot/dts/renesas/r9a07g043u.dtsi   |  25 ++++
 .../boot/dts/renesas/r9a07g043u11-smarc.dts   | 111 ++++++++++++++++++
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c |   8 +-
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c  |  11 ++
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c  |   3 +-
 6 files changed, 185 insertions(+), 5 deletions(-)

-- 
2.43.0

