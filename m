Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795541330;
	b=rEmgoRUGjcslDMXQmgOfiFQUfqaY50/k3yqBDb3FZBwbvEu4XoHcZGFpp/ZKm88DkQ/w
	 /EW0QpBuAhkUv6siyHEzD84xKCYakY37qoa5BucpbGQbSREEEK3xLqwOYxwh51i7q0wnP
	 2qhH+xwq8aInHlQXYs53TGF8UOCFyXMIfZHWFjLkceT03d3X+TM8RJlC3L5E1IPIg8B19
	 E4aGLZWTMFjGC2e3M71XWus0CVpz14ebKNCejHq5yAf1Bi2ORvnihEPPerJaK1FQnsQtV
	 iiTSUvx/sMZP+hy6467x1yVkbG5pk4z4b0Lo4/n0REP9xOrCipqcxSgSeM92M4QhHzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795541330;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=JAkdR+3eBgE3B5MqOfsX36lY9nOmnfkSBHmQMoRmyvc=;
	b=LfTU1BWNtWbunhuyjpxgEKs5PBbLLYROgqUyhO/2JR1pm+CrEkzz0fPZ6oYEaDFutAgP
	 vRSXJ1HODQduTZAVtIHbq5BFflAmpmp/1dBF263k1MAN4M+KcVqDlSZub18QAoiHLeXTp
	 aaSbddMzt/rsL7Bs51l9xqxR7T9Z71SA8LldmDwnvH1uWVWo3e7/hTZQxNUK6ppEKD5xb
	 b5ROYG9tCYqP8XWyXJgMVbhbtwHu3r8fHdhy092jEWkXwQET89PIxOSTeN40uY8gwzIkk
	 fv3KRYE8VQhdcsBopaaFpC3InUr/oiJsFZWi9Kq5EgzVFkW8cAPi/6ICHyl9wmKFIWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BmyN2ORd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB33606A31E;
	Tue, 24 Nov 2026 17:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BmyN2ORd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60DC51F000D1;
	Tue, 24 Nov 2026 17:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795541329;
	bh=JAkdR+3eBgE3B5MqOfsX36lY9nOmnfkSBHmQMoRmyvc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=BmyN2ORdGBbeeX00xpzXmvMFjvaFgIalWrMvIwY8j7q40PEzcOR6tjR0O16rx6y/v
	 TiqyI2OF3UmN/zgdquwDB5SFPmPe8pU3S78C3kaPKr+mvJ3xq3VK7sT8S3hKWC5pfQ
	 BYzOvWb1nxYKvLrFem2vAoa3vDpieYqMJGN5lFlRtJeM+31mZ+k0olRnG0yr49z4kU
	 U0h7krOjcE1g5GOqYD2Imuh2WDU9fJN/aUXIXaDix6rN0FZZjZi8HyoriQakU8FItf
	 XzeGLhuD9tKdCLtvsPpqL0U4W4sv7NiC0lxCv7OeH9mCc7dxR8RdG7GmVcLyWtLVJp
	 /8sVgIU8fFVCw==
From: Geert Uytterhoeven <geert@kernel.org>
To: soc@lists.linux.dev
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 2/2] Renesas DTS updates for v7.5
Date: Tue, 24 Nov 2026 18:28:36 +0100
Message-ID: <cover.1795540800.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795540796.git.geert+renesas@glider.be>
References: <cover.1795540796.git.geert+renesas@glider.be>
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

From: Geert Uytterhoeven <geert+renesas@glider.be>

The following changes since commit 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4:

  Linux 7.4-rc1 (2026-11-01 13:26:31 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dts-for-v7.5-tag1

for you to fetch changes up to df85c8ee22391046200bb057c85717eb906e464a:

  arm64: dts: renesas: rzg3s-smarc: Enable CAN-FD (2026-11-23 11:05:32 +0100)

----------------------------------------------------------------
Renesas DTS updates for v7.5

  - Add more timer support for the RZ/N1 SoC,
  - Add PCIe endpoint suppport for the Renesas Spider development board,
  - Add CAN-FD support for the RZ/G3L and RZ/G3S SoCs and their SMARC
    boards.

----------------------------------------------------------------
Biju Das (2):
      arm64: dts: renesas: r9a08g046: Add CAN-FD node
      arm64: dts: renesas: r9a08g046l48-smarc: Enable CAN-FD

Claudiu Beznea (2):
      arm64: dts: renesas: r9a08g045: Add CAN-FD node
      arm64: dts: renesas: rzg3s-smarc: Enable CAN-FD

Herve Codina (Schneider Electric) (1):
      ARM: dts: renesas: r9a06g032: Add support for timers

Koichiro Den (1):
      arm64: dts: renesas: spider: Add overlay for PCIe ch0 endpoint mode

 arch/arm/boot/dts/renesas/r9a06g032.dtsi           | 34 ++++++++++++++++
 arch/arm64/boot/dts/renesas/Makefile               |  3 ++
 .../boot/dts/renesas/r8a779f0-spider-pcie0-ep.dtso | 21 ++++++++++
 arch/arm64/boot/dts/renesas/r9a08g045.dtsi         | 39 ++++++++++++++++++
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi         | 43 +++++++++++++++++++-
 arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts | 46 ++++++++++++++++++++++
 arch/arm64/boot/dts/renesas/rzg3s-smarc-switches.h | 12 ++++++
 arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi       | 45 +++++++++++++++++++++
 8 files changed, 242 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779f0-spider-pcie0-ep.dtso
