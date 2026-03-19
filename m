Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C91F2D7DD2;
	Thu, 19 Mar 2026 14:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773932239; cv=none; b=pGUiMpkar5qrnTisJS4/s6sKQQs5y6GGQCmrr6eYlGZANvfrTKWJd3WeVhbWWxk9E3vn5/t42ys7SD7g5piL/+WxGd76u9U30KFRQRUKxF0e+LNN1PnzyKSbB1iOfQb1eDS5eFzvtQTVEoQtPEzUhV2Dk3Tr9IcQbv3Kc5/g0vM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773932239; c=relaxed/simple;
	bh=Rg0bdmkZjDIKnna0v1xQGh1Q6uk23KAWG2DpfPBbaM8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FbcHc7CjbpwMDlOYKBwSlUC6SjUyK/HN+g550vJjyuLAJhKhx8CvasnYwQNej+7Z6Oqkhx0vWCLGBvQ1S9IDOZh61Gh+Emb///D/AFaS5IKogZRaAtb8VjAWbbzq2TNBiZpMpTBbOXNfDy1Uh3FnNZF7DaY/x8R77UCQj92SI4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Q5V4v69q; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Q5V4v69q"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4fc81K0X5sz9v0w;
	Thu, 19 Mar 2026 15:57:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1773932229;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9AYNGofrov0NXk0mROSo5zmXiAHuqCpyPtaqK1jVNzc=;
	b=Q5V4v69qe/Dz8wu3PC9jDGk1nQYMPceTNpFJs9TAAZBrJtxvs3NAc0qnJHt2hw4oYc+/fW
	fgamqAamnCZLjNQyhshu5E+wkcphcb5Jp67lV8iuygSupkkQ4aAzxXR44f6+0Z0yoVrUT6
	6pzOkmDErW7alRHb/ltGbkYYk84B7AmIFJLjCu3U3oCdY7kRjs8qnR2XJCMEMB1zQzCt+d
	Eg1owXAji1Z7dLa4l9onxZjFRO+90GLKldlo+K08FjxPEeRjmtzZUR9/DcHL2VEZxTYMei
	EQ9fXAzhPuUs4jop1Y4Tt0HQnO87IJqt6HqOlvUDGIvvvNMexVONc3kXfzSzZg==
Message-ID: <20a8161e-3fee-418c-8168-86e9830016cd@mailbox.org>
Date: Thu, 19 Mar 2026 15:57:05 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] arm64: dts: beacon-renesom-baseboard: Remove LVDS Panel
To: Adam Ford <aford173@gmail.com>, linux-renesas-soc@vger.kernel.org
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260319132907.2350458-1-aford173@gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20260319132907.2350458-1-aford173@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: 6s97ex5syrdfiepe1ekur1n7bwrmpoz7
X-MBO-RS-ID: e29b1375865aa8e802c

On 3/19/26 2:29 PM, Adam Ford wrote:
> The LVDS Panel was never shipped from Beacon, and there are device
> tree errors, so rather than trying to fix them, remove it instead.
> 
> Signed-off-by: Adam Ford <aford173@gmail.com>
Reviewed-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thank you ! (and good bye another DT checker warning)
