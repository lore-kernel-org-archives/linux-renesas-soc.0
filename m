Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C18C223323;
	Sat,  2 May 2026 21:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777755796; cv=none; b=Xq/Eckn9iM1zdXQ/Ko7nE9FehrRCXhJIwmcOP6qm0W30jVL/JB7wjJemFHLz+1D/DZkSViMwR0IfydDZEQtybr4jg6ikkTzRNwk+lVjZXrZxHlXMPlzQcO6Sm9KdLs1e6aXmr+bKSmKswkSPtjhuyCyi8terInEPPJoOTchOh60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777755796; c=relaxed/simple;
	bh=RWmsMlVEt6wRtm3rhUJsetvp5hbkg7PccvXaGjFQzUw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UOG3HoK91VWlkS+Ph9VUGXI0gODyvtA1NUkDKa0yBWeDOvj/cVmu6PHUx45PaEKb3Mm9Lakd5gYJzDwfwGavj4BBADTU3fo9/uFUIIDB3TRkXspXkNpU/VdgX22dTkA0axDqvom+BWhoJ4slgp88e6SNVJKL4YybKTv7HcvM8BA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=YB59hoP1; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="YB59hoP1"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4g7L3L1nzZz9v7B;
	Sat,  2 May 2026 23:03:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777755790;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V24hZH9hLzSHoBe2Onyn3yrg7VhmzueP5emO4UwbnZ8=;
	b=YB59hoP15QKCDOsHckAB1KEbys+MO+z6ucQTnwAaDKHWkOg0H/Wc8rz4Jyh45yE8o+zj0b
	VO/piQUjAz0tX1LW3dG20aDaXkUvDKE7VFi6JYPojjDCQib+/otUwekktYzoDxtv1YKtSe
	2mCQ9rS7b9zbVjBOMKFz6N6MNFdWIwjy34TAnXK2r9cl3ZtOIxSXLmwDstzqtLHA1eqadH
	TIcE0uLUXIw56cOJZobm1/ZgtAPVcHy9aRdajt5rKkPlLr+YJNwDRCus/SLAuQ2f+PWHOA
	yD/zk/R4sdsZrqRnriMmmjy9J1losOJUIExcTUcdxTZcIRuAjGgKIqT/86AlYg==
Message-ID: <09730fa3-ae28-4b4f-968c-e62a0a027159@mailbox.org>
Date: Sat, 2 May 2026 23:03:07 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] checkpatch: Update DT bindings should be a separate patch
 text
To: Joe Perches <joe@perches.com>, devicetree@vger.kernel.org
Cc: Andy Whitcroft <apw@canonical.com>,
 Dwaipayan Ray <dwaipayanray1@gmail.com>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>, Rob Herring <robh@kernel.org>,
 linux-renesas-soc@vger.kernel.org
References: <20260502191052.94729-1-marek.vasut+renesas@mailbox.org>
 <bb99f0086fc62bc09af132a41fdc8e874ed05a14.camel@perches.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <bb99f0086fc62bc09af132a41fdc8e874ed05a14.camel@perches.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: mpdmc17x44p5xybto9wk6jjh44tjqpuu
X-MBO-RS-ID: 9ce206ae60e92722c26

On 5/2/26 10:03 PM, Joe Perches wrote:
> On Sat, 2026-05-02 at 21:10 +0200, Marek Vasut wrote:
>> The current message can be slightly misleading, because it triggers
>> on a patchset which contains the following sequence of patches, even
>> if the bindings and headers are clearly a separate patch:
> 
> I agree with Krzysztof, I don't find the existing text unclear.
I guess it is just me who was confused my the output then.
