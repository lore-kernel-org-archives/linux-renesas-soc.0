Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C6F53F23D9;
	Thu, 16 Jul 2026 10:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784196234; cv=none; b=e/zzLe4pg/AauPrcNrDWuTOaEcfA4UsQtfIQmcuR1YOt6XzwvtN3WSGG2B5LIYfbxvoaWzfIwcrX0ZCpuZQXN6/YxO+5kV5wgBOELOSO4RhlkScJuZUBaljGGlvJexqXL5VbrFruMwfxrtVD7ysJ1FGXAJoV+rkX0XwDNm4Ff1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784196234; c=relaxed/simple;
	bh=hbqYmLWvhDJ0LlTjn+wBQLKnfvgKuMd8ZesZCtaDwxg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l55pEDDeZ+0rQN17zJ4lqeHWtYfnTsQqRdOOrxjEfiqKGc6LQpPpyvZQN0Ugng/ikbgD+qfUtX5dWb2WwmhDt6SYPxc/CjHx5QigKKoGI0gaMOLjMz7rbfLomKaPQ7IZsC6/6uAFZVsGYtOUzdYDJzuJxaRXqG6xumIz++77le8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 806D71F00A3D;
	Thu, 16 Jul 2026 10:03:50 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 1/3] Renesas ARM SoC updates for v7.3
Date: Thu, 16 Jul 2026 12:03:41 +0200
Message-ID: <cover.1784194403.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1784194401.git.geert+renesas@glider.be>
References: <cover.1784194401.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-arm-soc-for-v7.3-tag1

for you to fetch changes up to c902a6887eaadf56e6da79f68f8843cbe45cc808:

  ARM: shmobile: rcar-gen2: Use of_machine_compatible_match() helper (2026-06-29 11:18:03 +0200)

----------------------------------------------------------------
Renesas ARM SoC updates for v7.3

  - Use the of_machine_compatible_match() helper.

Thanks for pulling!

----------------------------------------------------------------
Geert Uytterhoeven (1):
      ARM: shmobile: rcar-gen2: Use of_machine_compatible_match() helper

 arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c | 10 +++++-----
 arch/arm/mach-shmobile/setup-rcar-gen2.c           |  9 +++++----
 2 files changed, 10 insertions(+), 9 deletions(-)
