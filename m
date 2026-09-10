Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 008233955C0;
	Thu, 10 Sep 2026 08:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789028361; cv=none; b=IBN66Q4tgQ2d/lhZDEi3vbqxW5lVIlWaWFreJo//LbeFZsP8hkeuz5E/WcKwZ/4olSHOk7SBPXQQqcageqD6AZaTo6mb1HGpvhzvy5GtfoueNbPH3mcomyOce1YWIqMRjTrXG26NBstarA4TM5bZFoIkp7F1CWjrFMe0NoSfq2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789028361; c=relaxed/simple;
	bh=P/a0gKHNSWoZw3o+s5pYRZjO3bmwUnZcHMB5wSK9tCk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OGGcyGw1S+CehESgq1f7Iz521i2rYcQ7SzqOCeRZwhyknMpRvf1HqkVIuHSczTFVMTZp/cSvH6VcbJYKm3o/33O3EGvN3rUczT9uuw7BRLAu9HIuPWxoLd3Qxonj5R7r9vCgAGvbWxDNVv6ctUxjMSh4HqI58WPBIoNZjAexlFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DE1D1F0089A;
	Thu, 10 Sep 2026 08:19:15 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Alessio Belle <alessio.belle@imgtec.com>,
	Luigi Santivetti <luigi.santivetti@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Anh Nguyen <anh.nguyen.pv@renesas.com>
Cc: imagination@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 0/3] power: Add Renesas R-Car V4H and V4M support
Date: Thu, 10 Sep 2026 10:19:08 +0200
Message-ID: <cover.1789028076.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi all,

This patch series documents support for the Imagination Technologies
GPUs integrated in Renesas R-Car V4H and V4M SoCs, and adds device nodes
for them to the SoC-specific DTS files.

I wrote these patches a while ago, and never submitted them, as these
GPUs do not work due to missing or failing firmware.  However, people
showed interested, so I decided to post them.

Thanks for your comments!

Geert Uytterhoeven (3):
  dt-bindings: gpu: img,powervr-rogue: Document R-Car V4H and V4M
    support
  arm64: dts: renesas: r8a779g0: Add GPU node
  arm64: dts: renesas: r8a779h0: Add GPU node

 .../bindings/gpu/img,powervr-rogue.yaml       | 22 ++++++++++++++++++-
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi     | 21 ++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a779h0.dtsi     | 21 ++++++++++++++++++
 3 files changed, 63 insertions(+), 1 deletion(-)

-- 
2.43.0

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
