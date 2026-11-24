Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795541323;
	b=ef/ea9EeafFl4o0DLBeuSCwRhftCedgPcYYTgw/8/jR0BfJSoTsl/NU93l7KgrToBt/Y
	 erwZaX6wia3wluCpjXSnDKlwBKPBgsScgybxFMxdMP2Rwcl7EPk5Ffa1AHrVOFQYF6xDP
	 IdGm12ie1u8Xy6PB4JsxAQ1jLWQcNHWXJdhmfpV1/S3f3uQ5X8jQNyTlfYF/lKbzmQPwD
	 If/h/kGZDQWRgB4MLKkJDxC7r3j0OlkTzjRqsTOavbIuisTXZQBOysynYpmG/MXt69Ude
	 I11lPK+gF+tOIRNzWNZjlRBHYCjK0e0yzLyPIFX+rd8EC0wrSIUzDttJZGuP9PLPkJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795541323;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xJO/OmYsZbOpn42pFuKnAMKubcS7Hm/7IZ6VUtlUljg=;
	b=ApTOyzzClQELpLvmMqKyUx0rNjPLV0nynQQ5AYkx3qh3V8FZUwxmE1NdaUwibdEHy3gf
	 GEESIx5zvp/LYENQdfGqlbXy8VJcq/tOgLXcKAzrg3Y9zO5BgB9OZR4SV+L7Ik4mja94I
	 gXbTo5FD9VyXCrsyHmpMpjh3n2PHr9MsjQh1BY+XzjXmylOUnmb4nQbfaRmbSdB+ydiv2
	 inB6Rcov+S7ijVwFomPuwbgIs6G3sFRNGeby0ItsnPqWJaCIaJQAmpg3Abo83DplsgehN
	 ZhGCIiMUvHO1nCFh1VeVAW+Kzj/bZm+zDenQfrcXkcHyvkbD7ChROyhwlg/qgtSwhzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PvtPtp3J;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 008F5606A332;
	Tue, 24 Nov 2026 17:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PvtPtp3J
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 567BA1F000C0;
	Tue, 24 Nov 2026 17:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795541322;
	bh=xJO/OmYsZbOpn42pFuKnAMKubcS7Hm/7IZ6VUtlUljg=;
	h=From:To:Cc:Subject:Date;
	b=PvtPtp3J/OSEiGZKGAHlU2/Mkkh/EoHCtGmaeaDTU1lGmMqULOxGlY5q+hQs2QwG8
	 7r1A/aowCqx0jXc7z8JUqrYd2CU2e7T/tMHmCJ8H9mmRya9c7N00KSKG4o+wBxQ3AX
	 SvBMWlSi5BlbEd0s6yUrp0Dj6R6OUKoamtW1B/i4YQVmP+/ojtqHg3y4XxKxR4PJpu
	 dPJoYsm3HbS4/it38faD+WciPVsl6sgQXZIyaloumr15LRVCxtKRt4qOyFwggzpbEd
	 GHH3+o7RBAIijvel1t4Z/BQGSgWXDxDHpdzABvF1G86ZkCytE1z6ILiOliK1CSkTZa
	 UORzBS04L26JQ==
From: Geert Uytterhoeven <geert@kernel.org>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 0/2] Renesas SoC updates for v7.5
Date: Tue, 24 Nov 2026 18:28:34 +0100
Message-ID: <cover.1795540796.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
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

	Hi SoC folks,

This is my first pull request for the inclusion of Renesas SoC updates
for v7.5.

It consists of two parts:

  [GIT PULL 1/2] Renesas ARM defconfig updates for v7.5

    - Refresh the ARM SH-Mobile defconfig for v7.4-rc1,
    - Enable support for Renesas RZ/T2H and RZ/N2H RTCs in the ARM64
      defconfig.

  [GIT PULL 2/2] Renesas DTS updates for v7.5

    - Add more timer support for the RZ/N1 SoC,
    - Add PCIe endpoint suppport for the Renesas Spider development board,
    - Add CAN-FD support for the RZ/G3L and RZ/G3S SoCs and their SMARC
      boards.

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
