Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25443FFADD
	for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Mar 2026 14:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774364084; cv=none; b=A0r5Wkp8udxN/lAyt+ASYoScNGAlrEWoHl0NfXezI7M99E9jE7tBXU9dSU4nuEbHJ8ty0vUZHS71XomIRc32R5sQFKxh6mZCwScNBxNMn3PhuEHtdJrTVnJcmkp0JEZpyOdFxw+drOuwoph6eHEmHmCB7X/Oumt3HCaAqW0SPd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774364084; c=relaxed/simple;
	bh=gWl9dIHl8aAS+3rdjcjpM/JjQ7W8LEouScOvV1WMq2U=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=aX6R7jTnROPUwrK2oxF8kLBSBMF7VdKdtWygznggtXMYVseFHFKrwM0fqi3s4jpPmYmVIm+9tmhxuAkXvnl28AUeCWE0w0YSn0EWH4eUGzVMqgjEBLChV4zxc2JEtiAU5SfJpYy0awkmrPCXu+4T6RBPgWukit/pZ6YaOes4nv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=mIEBVpEB; arc=none smtp.client-ip=91.218.175.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="mIEBVpEB"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1774364071;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gWl9dIHl8aAS+3rdjcjpM/JjQ7W8LEouScOvV1WMq2U=;
	b=mIEBVpEBU+LpaLHe7NeEc2CIzcf0iGczuSLFhNohm2gjUWGCk0R1jgyHD9ZGIL6XS7AUJ6
	+69J7khj0hWXIuxZk8INOUNPaOwIm8uBP2deTAS+HvF2Cb2QZrHVW0dwTEn84P96Rl9U55
	cyEQSmjianc87yP0thXaYxMEFzO2wkI=
From: Roman Gushchin <roman.gushchin@linux.dev>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,  linux-kernel@vger.kernel.org,  Jassi
 Brar <jassisinghbrar@gmail.com>,  Kuninori Morimoto
 <kuninori.morimoto.gx@renesas.com>,  Geert Uytterhoeven
 <geert+renesas@glider.be>,  Magnus Damm <magnus.damm@gmail.com>
Subject: Re: Sashiko review feedback (was Re: [PATCH 2/3] soc: renesas: Add
 Renesas R-Car MFIS driver)
In-Reply-To: <acIsrJp2Zq2ntS5f@shikoro> (Wolfram Sang's message of "Tue, 24
	Mar 2026 07:18:20 +0100")
References: <20260317130638.2804-1-wsa+renesas@sang-engineering.com>
	<20260317130638.2804-3-wsa+renesas@sang-engineering.com>
	<ab-vWbjdlAIt1qaX@ninjato> <87a4vyynl2.fsf@linux.dev>
	<acIsrJp2Zq2ntS5f@shikoro>
Date: Tue, 24 Mar 2026 07:54:25 -0700
Message-ID: <87ikalp9b2.fsf@linux.dev>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Migadu-Flow: FLOW_OUT

Wolfram Sang <wsa+renesas@sang-engineering.com> writes:

> Hi Roman,
>
>> These replies are definitely helpful! I can't realistically look into
>> all cases across all subsystems (I simple have not enough expertise),
>> but I'll try to look into most cases and hope that other engineers will
>> help here.
>
> Sure thing. Is there a dedicated mailing-list or better email address I
> can add?

Not yet, but I think of creating one.

Thanks!
