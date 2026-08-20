Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4366F46D57D;
	Thu, 20 Aug 2026 17:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787247776; cv=none; b=clo5A681xolyZJHtCQgUz9f+iLYBSL8ItDtq4y90WegnXZmjZvOTg/1/v830hRJMf7AboYggCRJ8yDLEqiD3dMpGLDufh6hLCM+bQNp0JKlXZrbOZPG5UVA0wYwDVmykHr6aQVqOsGlQVBvgZdkIl+uC22MOCK5yylneiKCUH8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787247776; c=relaxed/simple;
	bh=HVRzDGs6cRPxZ++DtLwLQA6dXlj6FyA7ekw7bHm54qM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AIXs67pQKoqstTtnkiz7CoxgsFcFdJXZNdIDq+YfXxtXGuJ9c8X1hgGBRa5fYlLJh1RkOHer7nLch7C4G4FuR3ydpTEsdiG0VfHznl7w7Xj4tNdWwLLKuCPRLcF5RVSv0lIUurzlYjBALLQ8qvqPjF+yORJKA4JJVlgB/uZG75o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=vi+xYTZe; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="vi+xYTZe"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4hQrPP6QnwzMlGJ;
	Thu, 20 Aug 2026 19:42:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1787247769;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PL0+TkBEAw/ljLIv0zv8/yDD3v/lKZn/hBCUcu+4UtU=;
	b=vi+xYTZegipotKL2tNDLtKIfr4Q7NZSS5N0m7PDg/g8LrdQpp4i6KQfVK3X65QtNmBHIu7
	P/UGH7eS0JL4OYHymF9Lhp7YSbmWFcxzK/wfGtjMZ23pB6mka6/s8UeWaBkxFsgqBhkNdW
	shMZ5LHf2hOb8GoIJJ99oaQnNGYwd1cUwU9tI2GZyrFxuN3+MKwriStrZb+5IdPvZLfGnk
	N8FuBrs9NJqcHRld0M2/TbwNZk6+IKqjDjoqjjmWJsGNM1eOWlgDEKJSA/lswdK3t5F+DI
	mJDo/ZppsrTd+hWac4XKyeuydmpW00w22a+JK/Xdw07brYPWNDKTUAAsJxOEAA==
Message-ID: <ca696ae8-4d26-416a-aaae-1e54cacf9fb8@mailbox.org>
Date: Thu, 20 Aug 2026 19:42:45 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 1/4] dt-bindings: display: panel: Document 10" Raspberry
 Pi Touch Display 2
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@gmail.com>, Jessica Zhang <jesszhan0024@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org
References: <20260809200107.842945-1-marek.vasut+renesas@mailbox.org>
 <20260817-whimsical-fictional-dove-89b3d6@quoll>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20260817-whimsical-fictional-dove-89b3d6@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: ayciih47b1nm1gj34y6j84hzzwq7ik4p
X-MBO-RS-ID: 5080b6edc4b6540025f

On 8/17/26 9:42 AM, Krzysztof Kozlowski wrote:

>> +++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili79600a.yaml
>> @@ -0,0 +1,65 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/panel/ilitek,ili79600a.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Ilitek ILI79600A based MIPI-DSI panels
>> +
>> +maintainers:
>> +  - Dave Stevenson <dave.stevenson@raspberrypi.com>
>> +  - Marek Vasut <marek.vasut+renesas@mailbox.org>
>> +
>> +allOf:
>> +  - $ref: panel-common.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    items:
>> +      - enum:
>> +          - raspberrypi,dsi-10inch
>> +      - const: ilitek,ili79600a
> 
> Binding looks exactly like boe,tv101wum-nl6, so either properties are
> copy-pasted without checking in datasheet

There is no publicly available datasheet, but ...

>  or this does not need new
> binding file.

... Documentation/devicetree/bindings/display/panel/ilitek,il79900a.yaml 
could be extended instead, so that is what I will do now. The devices 
are compatible.
