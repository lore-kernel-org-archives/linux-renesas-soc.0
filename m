Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7232B41D4C3
	for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Jul 2026 09:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783329035; cv=none; b=U8VhHwZ49a6Cl8cy430vrm7WtOQpy1nHvpfe24B3ysmOTp8eD6F5d7OunKc3wrXFDeDqx0g77gc6TkDERDvWNft0DAh29xH4ngcqVkUiss2xBGBNJ+LD/OyYVfnh6xNb0PWaSzztREHA4T0cd9WzURMyCoxq78rR7IRvxQyAuoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783329035; c=relaxed/simple;
	bh=HFIAirpKxq4Dim87YDMP8BE/1CbJFX2Gbkswc02tIus=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=KpB51yb6wQT9Z8VrnG/Y1CLp05FEVCskzDYnCE9J+fuKi+4I/tmrR+tTOSmemiyg8rWp0oQ7Y/fG03NKpQktx5Qq8R1cgS3S1jcZkKoM66mLDb0qa676n/EX0Gqr/y49TieqrczEHuEw8pdR6yUxBE5cVTp1E4woTbS3mC9AI9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=afd9UC99; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="afd9UC99"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8CBB1F000E9
	for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Jul 2026 09:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783329026;
	bh=rYm8a3EGTJKmaduXlHfgfRAj2+K43IKORJXfzaLsrVg=;
	h=Subject:From:Date:To;
	b=afd9UC99b4Ye+0tk0Y35FkRAQ/6+WKXWgYJgviy27delU4StKuHxZKfSnyPQv9EOg
	 uHFMIQau2j/LqeAB/6yd+NtrvmGJtgBO3U7pX+D3z49r6L6wY3Bj8TrkjuGfhTjCIY
	 r2henyNKRFLzoGoCyN5pw+a2bmepRobcivOhCZg5eL8DHXjRDqA1pEeYIxByiAB5vx
	 liyYWXm1v/Qub8VSkIV3KiXXH6exnT8W441hacIJ4Vqxec+mZ73N2I1YeFC/+cV+mZ
	 2MyWx6Ibo8c9BYABcp2t5Kx2aebCwq10ZPzIpPOCBKahyp0o2RtYOarLyI2syrVqBG
	 9y7LIJSpuSWYA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 9618A3AB0921
	for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Jul 2026 09:10:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From: patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: 
 <178332900721.448273.17793584380890834586.git-patchwork-summary@kernel.org>
Date: Mon, 06 Jul 2026 09:10:07 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Patch: [PATCH/LOCAL] arm64: renesas: defconfig: Refresh for v7.2-rc1
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1119709
  Lore link: https://lore.kernel.org/r/bb081f7fe646a83c9b59764267f67116db7aa052.1782907421.git.geert+renesas@glider.be

Patch: [PATCH/LOCAL] riscv: rzfive: defconfig: Refresh for v7.2-rc1
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1119710
  Lore link: https://lore.kernel.org/r/acdb2c6320865c24bbd3bf7a83c35db21cefd21b.1782907423.git.geert+renesas@glider.be


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


