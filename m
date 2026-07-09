Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84BFB3F44E2
	for <linux-renesas-soc@vger.kernel.org>; Thu,  9 Jul 2026 11:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783596079; cv=none; b=GzlRizpwTbVnQuAoN+b7uyJFM17gCCC23TK5vutGLgafaEbFRrYQiYHfacZiAwK20bXY52kX4Dz0dWsNSe8dPtru1GDPa2oWbIZAMiDPS/JjcH+Xlq5rgsHynqJnxetU3NfJ6PHsfQttgau3Bs9tgCKK7TzLy3E+GPloGpxrQMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783596079; c=relaxed/simple;
	bh=2VyPq2t+dOLfBWVoMYpW8vCVILl/eiSO7aCcB0JKYj0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kpXL206b3RUKGhT2vn5dt4oEoKLXv5hqhYZQ9T8ipT0mH98A34OJ+xg18TCoxDqeO7MjrRsCHxryPrWrt8tn3HxvO52vHWiESCoGXev1vVtcZLPBI+NPCxUfIqKbXrhYxjypwzN54SRTyFD+Enpio4nQjTq4etKwMNEAUIArKGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=OgCZhmCb; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="OgCZhmCb"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4gwswT4P6Lz8v5B;
	Thu, 09 Jul 2026 13:21:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783596073;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DBYB7b1WWhEAMItaDQhK+Z3zDJbr0ZJMB5I7IpRMH40=;
	b=OgCZhmCblaPezjAsJ8oRCkwQ+Idt+4vZolTS2e84ee9IbYbLrhY6LEdXryUY+tbnc4qc2i
	YlzbL4YPMr/OOlEkqL/AABfR0eLxPkfPt4yfMBqXzyKi3/l4UFsS4cEwwMQ/CSUnopYGAC
	wOSpwh2gId3hvpIMFE3rf6GquJoUgYtjbfguQ8gNNBw5Q3VWPdrU3IYxxL8fkVkAe00hME
	Ne0yFHREVENbvbiC8SfPTPnC8WPjaO5q6utuy7azK28PHz9YLBM5p790A8PaFFiKmyj6xP
	z9wY/+9GFXn7Q28TqmzCutuLlkljkk7EckRE4NB0znkO+j05spfnegEHY2iOrA==
Message-ID: <b4679822-85e2-4eab-8886-056e56db28eb@mailbox.org>
Date: Thu, 9 Jul 2026 13:21:10 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] soc: renesas: r8a78000: Drop duplicate "default
 ARCH_RENESAS"
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Huy Bui <huy.bui.wm@renesas.com>,
 Duy Nguyen <duy.nguyen.rh@renesas.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <64de6e95719a6dec7412cf7e917a42749e738b99.1783593775.git.geert+renesas@glider.be>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <64de6e95719a6dec7412cf7e917a42749e738b99.1783593775.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: d65fb8f0ee2d5d48ccc
X-MBO-RS-META: tiidnmgg35hcxzg5id87y43xxwgh69kt

On 7/9/26 12:47 PM, Geert Uytterhoeven wrote:
> The Kconfig entry for ARCH_R8A78000 contains both "default y if
> ARCH_RENESAS" and "default ARCH_RENESAS", which are sort-of duplicates.
> 
> Drop the latter, to restore consistency with the other ARM64 entries.
> 
> Fixes: 5284d0b09d1bdc69 ("soc: renesas: Identify R-Car X5H")
> Reported-by: Marek Vasut <marek.vasut@mailbox.org>
> Closes: https://lore.kernel.org/a069d50d-030d-4189-ae9d-37f989829da4@mailbox.org
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
