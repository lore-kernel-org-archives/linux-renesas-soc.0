Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EBA4357D0E;
	Mon, 22 Jun 2026 13:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782136583; cv=none; b=NXDIaGfVfDV2ShgRmCN8SawrEmhD98prIEz/6ZvmdN22iq0oTn7yy99Z+Zqxk9oCEDynepRVTzbyLy4eaaiSL4YCpHbcAWUUJ0qzsNxDztB8yVrVrHwy6aXmEBiELqKo2ey+Z/T/88Gl0dmgS2Rp+R2QCX8a84bvNJgsZyybwks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782136583; c=relaxed/simple;
	bh=VLGNUOJWgetLw2CTOTASzxRBJpVRnxen9R190hFjPas=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NGT38AsmvWG48tBA2xO4AFfcmXX2igHidiEf2nyna5n/Psg7JiN+4cLiyQpAsdoqkkq5K8TsE3abxQnHdu06UoZ8ghrIXlGDFB4kr0CpvSfwTyjzBmtb5SDQLzLH5pNcnY9K8aEy8an6NhZzYn+rbtiD2CKhDLn8K/0nvUDha90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=xcccWhVR; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="xcccWhVR"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4gkV9G3Dn8z9tsN;
	Mon, 22 Jun 2026 15:56:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1782136578;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V10NUk/gmPuBAXU0YzRkHmie0gZ9BDAPSeyjEgvzMHg=;
	b=xcccWhVRSqDJHc/6NDRssnzaOOnGncLgvpUTUmdX2/FF2bKqUFl5lyKlsqIoZOeBYGlh5o
	OVwPiUc/yIjaMqkESFLCFicMXXxgb0S8PmqfchDuCkp9UJS8I33pmRnTqGVNe93MfeFp4W
	maVbfu0iR049vBzocLiZcujqbZ7XXoZ3Vu8LW0FbGfPODawn2FgAyIYMJ0iXnOm+AAB5GR
	aRickCq0EjdcikS9ABqqfDm1xVBn8Tspn6/SUiryd9LxztdC0PJDohwXd3VspxDwEBM4XV
	xalM/P3L6KNuvy9HPQh3cEeSiljnhM38QSVfBf7x5knmYsoJwDiAbu67VIUvSw==
Message-ID: <8cb1c3cb-3d8f-4e76-99e9-ad78ee149556@mailbox.org>
Date: Mon, 22 Jun 2026 15:04:45 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 1/9] arm64: dts: renesas: r8a774a1: Add soc: label to soc
 node
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20260621025052.406507-1-marek.vasut+renesas@mailbox.org>
 <CAMuHMdUEPR0xWXRwLjBt5sF7i4HxcDLHCQGmc=gGvFmHRDv-Jw@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAMuHMdUEPR0xWXRwLjBt5sF7i4HxcDLHCQGmc=gGvFmHRDv-Jw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: dacb6e1149af34e4ecb
X-MBO-RS-META: t553dx187nxeb4i3g8oa88rprwqknbpr

On 6/22/26 12:35 PM, Geert Uytterhoeven wrote:

Hello Geert,

> On Sun, 21 Jun 2026 at 04:51, Marek Vasut
> <marek.vasut+renesas@mailbox.org> wrote:
>> Add soc: label to the /soc {} node to align the DT with r8a77951.dtsi
>> which already has that soc: label. The soc: label is useful in U-Boot
>> where it is used in U-Boot extras DT fragments.
>>
>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> 
> For the whole series:
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-devel for v7.3, squashed into a single
> commit. Unfortunately there is no cover letter, so I will have to add
> all nine Link-tags.

Is that why cover letter helps you ?

If so, I will start generating ones ?

Thank you for your help !

-- 
Best regards,
Marek Vasut
