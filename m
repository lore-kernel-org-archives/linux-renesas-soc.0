Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B70F91684B0;
	Wed, 27 May 2026 02:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779847622; cv=none; b=oqOyYar1XHodlMqkG/z8ueripll88+NZokHDW4eUBySTX24Jownkq+WjnYipTKWmCBzsJ/M3vLqSE60t2qMHZkeu9/68HdTUG8dckizEdo7lv4Ddh3GDgE5T5/wIsYB8omj5/61kOHXGv1hryjZ05ZFVQdcEovEoGzxdIINkRHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779847622; c=relaxed/simple;
	bh=aUaXtE7+Lpu6T9R6qedWabPBNZj9Omh3QoTrbc8F0Kc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rUkOgeubyKxo8MePtg0FgxpTzMP4FTBMrqRiGRXpP7Cclc/x+fVQCAKJNV0wtUoOKeJX9tdonQv1mZHAMdvYzFa+CyOgXXKwsWvMdZiVLxJAcWlV5OR2tejh9g/yKrsPNMPHI+MJbFqubMdWtzsYgHUME1bLLgFcQfh0A2ZswkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=QudllnWK; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="QudllnWK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1779847611;
	bh=aUaXtE7+Lpu6T9R6qedWabPBNZj9Omh3QoTrbc8F0Kc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=QudllnWKEx4Ncqd3j/B4pAxENZQG00b/raI64g1WXNXSkyJFxvhRo8OyqKXpXGeXV
	 l+1vU0zjGRn4lZX4s8ifV7kV43XLXGpUc6CyYaLCjzCp0Exs1mS26XNq49Lw8NJ7EO
	 Se4Zhsi3oX2QbbXFdyP78MuAnkwKp2yRLxlaDwhJJIcPKd7h9JvUE08KupTqQKQIiA
	 2S5+jyYwRXl0f1TW1oPd3ny7uEAI/Q2tSgPcgcJmTLV9y3culjJp7JHGBx8N8XBJ10
	 leeS+c87sfWWQEd0u7C6babUmMi4lQWmXCGyWwhQ59hpFyyA3Upz2hyxQqiUEFCV/4
	 FQsWPJbFsLS6A==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 9C417607F4;
	Wed, 27 May 2026 10:06:47 +0800 (AWST)
Message-ID: <e059b59ecb9b0912ae8a044e3f745450b7095573.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2 0/2] Add Meta Rainiera6 BMC support
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Neil Cheng <neilcheng0417@gmail.com>, robh@kernel.org,
 krzk+dt@kernel.org, 	conor+dt@kernel.org, joel@jms.id.au,
 geert+renesas@glider.be, 	magnus.damm@gmail.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Date: Wed, 27 May 2026 11:36:46 +0930
In-Reply-To: <cover.1779157117.git.neilcheng0417@gmail.com>
References: <cover.1779088499.git.neilcheng0417@gmail.com>
	 <cover.1779157117.git.neilcheng0417@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Neil,

On Tue, 2026-05-19 at 10:38 +0800, Neil Cheng wrote:
> Add initial device tree support for the Meta Rainiera6 platform.
>=20
> Changes in v2:
>=20
> - reorder adc0/adc1 properties
> - add Acked-by from Conor Dooley
>=20
> This series adds:
> - Meta Rainiera6 compatible entry
> - Rainiera6 BMC DTS

In the future can you please avoid threading v2 (and later) under your
prior submissions?

Thanks,

Andrew
