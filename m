Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795541327;
	b=xoY838qCw36is+iCAi0B5n2guw0WhdMt0T4nb49Pk846aHhTBZ6EpDsifrB11czC6PEa
	 bHYYmaZU8dhbA7K4XwDMQvH60sBy+zjfhXdEr1rFYjGk9Etdl9Lg8LrIK0BdhM7YR9oV5
	 IjGz0YKoeU8Ivh9woemFb23ScyxfE1hRDAc35YCjp3qm/gx1dLC1CGeiekAbXskrLcIz1
	 4LrmkNCsR1nnuc6+aqemkkYR7QYog7Nrx+Cic+CvJv4mJ5ThBEXBTP6vspa7n5pWC2zpt
	 EL4ZNlSx+Fyy0ew7iiseGT6oKBt5ysMo+y/2QzlrVqTTyzfmUjQW26mih1mkx/rb4hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795541327;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=8DVFuCOOgLb7+uhJDm59aDBFx3v8r0SbGwj459Jfm20=;
	b=qOx/w27KBrlkuya0pmZr/eC3JwKGE0uQ0DF0O2DzdglJq2FEsUIcpQeEzyb/izDvZKZD
	 G7Z1OiBH7F/6f+7cCsonEq9ALP9W15irdNhmgAsCDmFywfbZv7eBlYEqUaPB8Lu6HJ0pA
	 9jRteODdRhwauVoGO3Ci9jCECvzhLkZym3aF+aXdzjuxGBNEG6JDdOZA7Njq+kCQ7u/d3
	 N8qzPfE9D6RON2dXs/mOm2seM+tmrss51CMu+abWkxruhEsHpQLZGPBAU/p3Mbz91et8i
	 o1zEnQ4IlYqIZVEfyUX3KvB54aLUVcFPYC1tpjG4MpAL0+I8zZkNt730VTRMU9imKCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mtefFc8x;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E895606A32A;
	Tue, 24 Nov 2026 17:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mtefFc8x
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 820E81F000D0;
	Tue, 24 Nov 2026 17:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795541326;
	bh=8DVFuCOOgLb7+uhJDm59aDBFx3v8r0SbGwj459Jfm20=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=mtefFc8xWtGcIx1aN66A4Yn1WE0D6bJ/3ouhl5xNJ9SOKNvWCmp6gzb/L+Vc+Xuwv
	 fOlkkWYPQyRk9gxB257IS9bM0JEygthYEixcKehu1hD0YTOdTD+aAqKhQaGubLf5zQ
	 Uwbgu6bd7TyRrP0wKTTjbzC2akUl13pb3JM8ZbsjUzK8U1sSU7YVHOitlUvf+rm4vL
	 rSRsd2zYIy3U7i1JXR5wCC32BAA/1rjwLdNNHkxKb2XiK3V0pyaj8x++kaUdefiYSx
	 0zrsDexAu/EotHXEsJCr9qEirw0ssqQ3SeYclefQHEKwKX/ndYnUcsUCYh0bn0rLq7
	 /NvhozH/dWdLw==
From: Geert Uytterhoeven <geert@kernel.org>
To: soc@lists.linux.dev
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 1/2] Renesas ARM defconfig updates for v7.5
Date: Tue, 24 Nov 2026 18:28:35 +0100
Message-ID: <cover.1795540798.git.geert+renesas@glider.be>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-defconfig-for-v7.5-tag1

for you to fetch changes up to f4b3f6bff6a26acdfecb4ae6e41383cb3f9664c5:

  arm64: defconfig: Enable Renesas RZ/N1 RTC driver (2026-11-16 10:43:19 +0100)

----------------------------------------------------------------
Renesas ARM defconfig updates for v7.5

  - Refresh the ARM SH-Mobile defconfig for v7.4-rc1,
  - Enable support for Renesas RZ/T2H and RZ/N2H RTCs in the ARM64
    defconfig.

----------------------------------------------------------------
Geert Uytterhoeven (1):
      ARM: shmobile: defconfig: Refresh for v7.4-rc1

Lad Prabhakar (1):
      arm64: defconfig: Enable Renesas RZ/N1 RTC driver

 arch/arm/configs/shmobile_defconfig | 4 +++-
 arch/arm64/configs/defconfig        | 1 +
 2 files changed, 4 insertions(+), 1 deletion(-)
