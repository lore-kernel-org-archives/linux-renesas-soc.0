Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3030148424D;
	Fri, 25 Sep 2026 09:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790329714; cv=none; b=fBgDmfW2J6Qnd8kzMrsYWV6Gqyh4NtzTt4t42hm0jBL/tgiEtBN+SONcoXXqgvx5KRWQ8hIskpqap8dsM0HV1Lf3KTymlj/r3W+LjG7lQE7p7CDybpRorB4vvaATwIjnmlL3Tia/CO/L+ByOklZEFamBUkyzxatJDFGWUDwNjgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790329714; c=relaxed/simple;
	bh=NjLVS14if/D56akbo8g2fO7dZ7ShBsZeA5Bs4VPK77c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uTxYMhA0x5qRVXmnBJbTsFHrru0iqI8hZAyNceW/dRTkDn7IILWvfkW0Pn4Kk2EngYECVCpt2wEfKTB+oSJgsDBx/FFmW13infYcX2iHzEn0zoP7aspFfKSuEZSasu7rdB//H7w2AmSln30MZ5JRJu3oibwogFNfc4lfoC1lERY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=HZJBU2S3; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="HZJBU2S3"
Received: from [192.168.0.43] (chfd-03-b2-v4wan-176392-cust229.vm15.cable.virginm.net [82.19.20.230])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6287CC1;
	Fri, 25 Sep 2026 11:46:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1790329597;
	bh=NjLVS14if/D56akbo8g2fO7dZ7ShBsZeA5Bs4VPK77c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HZJBU2S38eHmYkJYdhFyGl8wwCYNYICMMceHhEhukIUcbJQM/rs40VjkPxN3hnkQm
	 DzRQiY1n34360T2ICePutfbxXgCgaclf8S8coQEkbDGqXPryqixNl3huQM5iZj5Jxk
	 +Zvz3vCy78OP3KnzG/1Wi8//t7eSLgqtiWUk7QWk=
Message-ID: <b9db2577-77f1-466e-b6b8-1eb6501d079f@ideasonboard.com>
Date: Fri, 25 Sep 2026 10:48:22 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r9a09g057: Add IVC and ISP nodes
To: Linus Walleij <linusw@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260922-mali-c55-renesas-dts-v1-0-cd63cdb51033@kernel.org>
 <20260922-mali-c55-renesas-dts-v1-1-cd63cdb51033@kernel.org>
 <CAMuHMdVkhSNDn3BpBt-9K8FPKhmODYVF-PCKr+AH8B+o4GHuJA@mail.gmail.com>
 <CAD++jLk6015ShhR0XAB+NfKF1Gf9ZWA8Z_=9uU6zNZ+wHS97fg@mail.gmail.com>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <CAD++jLk6015ShhR0XAB+NfKF1Gf9ZWA8Z_=9uU6zNZ+wHS97fg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi all

On 23/09/2026 18:17, Linus Walleij wrote:
> Hi Geert,
> 
>> Hi Linus,
>>
>> Thanks for your patch!
>>
>> On Tue, 22 Sept 2026 at 15:34, Linus Walleij <linusw@kernel.org> wrote:
>>> From: Daniel Scally <dan.scally@ideasonboard.com>
>>>
>>> Add the Input Video Control Block and Arm Mali-C55 ISP to the device
>>> tree file for the RZ/V2H(P) SoC.
>>>
>>> [Rebase onto v7.3-rc1, place the nodes in address order, and sort
>>>   the interrupt properties. - Linus Walleij]
>>>
>>> Assisted-by: LLM
>>
>> Dear LLM: Please take into account the review comments on the original
>> submission:
>> https://lore.kernel.org/CAMuHMdVCeMaQ8yFnMgr1Nko+0yQxn69BR9fGJ2WPvADMc2gvRQ@mail.gmail.com/
> 
> Don't blame the LLM, it's me.
> 
> I didn't find Daniel's original submission, just noticed this
> never made it upstream.
> 
> I'll address the comments and send a v2.

Huh; not sure why I never followed up on this. I haven't touched the board in some time, so it must 
have slipped my mind. I can pick it back up and address the comments, including adding the other 
interrupts.

Thanks
Dan

> 
> Yours,
> Linus Walleij

