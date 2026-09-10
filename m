Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D5C493D59;
	Thu, 10 Sep 2026 14:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789050060; cv=none; b=OBzCDA+my2luetc4Lj2VXti44w5xArmkIDhCCRN6HHDT4W3AgGN7jpS/2QY7i2OS/UpgQmvSX20q/PnmpvDuoAgBjZTrLsiRDGCuA6ZGapOtBsP9X5ovoF6Ojw/qgP2mzNui+U5pd0Q/tL/ajjSRSYNYogwl6e17tgVaxh9KaUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789050060; c=relaxed/simple;
	bh=TTRprxmI1C/pJ4vGFh1NmiQFkSUnD4tzXmVReW+27g0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TTqRH5fr/WMAEv57I83NyJ5KWWKSAKKyc2aRfgRXToaKFsZb1EKHNIv2cKF16qopLCwfFlmRcLgEw7UNL50nfWtUxBnxsXze1BG66Dcs5TKIuELXFmLFx6E9jEbkOQmNNEEzOR0RXjzmMm+rxErhTP5Fm/BUF8IeGXGlkUFltDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=yDK83tuM; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="yDK83tuM"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4hgfwc0Wx4zMl30;
	Thu, 10 Sep 2026 16:20:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1789050048;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vQ/dsCPkRG8hEn3IqMj2NKEg1v4mqBCakprJU0aCoeg=;
	b=yDK83tuM6+XDAbPc2le2pALPFq8W5BVcIimetsMdnPEdclRneYhqjS1y3oC/c/bBJgG67r
	XuT4wavxcHDLYyyYTI8MEeoJyO5028AwnvHRqSEi9MGn1DgceFBYmXVu4c99TzXE0cm4qp
	HpsIbRO10mhodXH31iX1ZCvP1xMlzJztp24mdMn1LB3pHc+qcvIHZQhzr5CKHiQcoPx61k
	0rXnHs40DTVU+PsbXoq4ZQQFBtii+nUTwaS4UP6aJpxFg0asIjPk275nuja5SGN+2GEyIG
	rUniRsinM6bllscsVwrP99j7CxOt/fyaxOojWpfFNiReYJYL+vXIgky6OwJweA==
Message-ID: <aee7e7be-b9c3-4d42-bc24-c29a94c0faaf@mailbox.org>
Date: Thu, 10 Sep 2026 16:20:41 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH/RFC 2/3] arm64: dts: renesas: r8a779g0: Add GPU node
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Alessio Belle <alessio.belle@imgtec.com>,
 Luigi Santivetti <luigi.santivetti@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Anh Nguyen <anh.nguyen.pv@renesas.com>
Cc: imagination@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <cover.1789028076.git.geert+renesas@glider.be>
 <2399b2755ee8f825c22ab12242d718d64745b239.1789028076.git.geert+renesas@glider.be>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <2399b2755ee8f825c22ab12242d718d64745b239.1789028076.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: wqu6jecx34w95ps8nrex46srsx1mwh3e
X-MBO-RS-ID: b5df833567eded1f17f

On 9/10/26 10:19 AM, Geert Uytterhoeven wrote:
> Add a device node for the Imagination Technologies IMG AXM-8-256 GPU.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Fails to load firmware:
> 
>      powervr fd000000.gpu: Direct firmware load for powervr/rogue_30.3.408.101_v1.fw failed with error -2
>      powervr fd000000.gpu: [drm] *ERROR* failed to load firmware powervr/rogue_30.3.408.101_v1.fw (err=-2)
> 
> Firmware not available in upstream linux-firmware or
> https://gitlab.freedesktop.org/imagination/linux-firmware.
The GPU is the next generation (Volcanic), that is why there is no firmware.
