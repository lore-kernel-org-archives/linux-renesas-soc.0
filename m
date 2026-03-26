Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10F0A345725;
	Thu, 26 Mar 2026 04:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774501141; cv=none; b=SRslu+mv+y2B3WpCFnU3bh7gGyiDy5rKoYaB1F5d2nCAeCOI0LWq9fwtuIZClN6B/set1Gl5UDxx73BdvDkKhRLouMopdA4pUxSpn/86FPOmwr7mC7372KsOokk6oe2dJkLXt7sF3JA4QQKD8gof5fFgmBkBDncRIPZjoM2Md/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774501141; c=relaxed/simple;
	bh=zcJDXkoqYUDxq+vGOm3gwU4bFXHMh5lwUqLBFYvjfF4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cy9duV76xMu2aFFK+0Kr/vDNjNEoo23AIuannyapb2qeNu8fLJBLaiPCPaeEYvmMvFy1o4I/y0D3rTKifSgQAnPViegwVsT/nkz4vvUt0m80w+raKlzz5ANEawP8/D8DrE7Mg6XC2urr8n75lKgjgQ2oMeM8W4ybA/KwxynvNhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=CUpgs9+e; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="CUpgs9+e"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4fhBPf4D4Rz9vLd;
	Thu, 26 Mar 2026 05:58:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774501126;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FxhWMHFepKywPAMq9Te2gDIZ/jliERuXqPwuGoAzPdA=;
	b=CUpgs9+ejnB101tRLpVjERzxLuLazVIaiJGPmBE6II4OhI3xTCumKWo79MwzMbK/2IjN7g
	yQouTzhET74LJ1ghGzbwcNfNlIjHhFJY2MaHneWIejybtjd3Z0Kt6WLrBDhSArWG439f8a
	xlIxEPHzOFHBzIM27oBhZxQVWi997FeBR6CL8MHiur0s+xoPaJxpVJWjVi8JPQGrQxPsNK
	f3OWIbUZO58BXTsImGcGUAd3WHrtK51g4RDbK4u+5ggex+cP/F/nMzlGN4GrJdP/vnUI0e
	EGEWrLE3lu8pF/VRxpNBIZ18/D1b7TJrk9aUww99TbQinmewWc5Yoldt/n9hOg==
Message-ID: <32a1ea50-fca3-4eed-996f-e28be1908770@mailbox.org>
Date: Thu, 26 Mar 2026 05:58:43 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 0/4] arm64: dts: renesas: Fix PHY C22 compatible strings
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "magnus.damm" <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
References: <20260313164008.40933-1-marek.vasut+renesas@mailbox.org>
 <TY3PR01MB11346A57519DD3EB5BB4456D38645A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CAMuHMdX5+smUnspgxnEy6ewL2-3htqeP-d0kX7muMVp9AAqO7A@mail.gmail.com>
 <TY3PR01MB11346A1E1E15BB94F5C692B408640A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <15b47af5-1249-4911-b9de-7ee177740314@mailbox.org>
 <CAMuHMdV_rGpnx6DzmdDgAsRJ4hXy8TP+pSnnzURjeGZfxB+5wg@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAMuHMdV_rGpnx6DzmdDgAsRJ4hXy8TP+pSnnzURjeGZfxB+5wg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: oiep73o1fw1siypm6hp3uraph4r9gapd
X-MBO-RS-ID: 91a01d07383b74c17a6

On 3/25/26 3:32 PM, Geert Uytterhoeven wrote:

Hello Geert,

> On Mon, 16 Mar 2026 at 13:37, Marek Vasut <marek.vasut@mailbox.org> wrote:
>> On 3/16/26 10:11 AM, Biju Das wrote:
>>>> There is also Marek's older series ([1][2], as Marek doesn't do cover letters ;-).
>>
>> You seem to be commenting on a 0/4 cover letter here ...
> 
> Ha, the exception to the general rule ;-)

Hehehe.

>>>> [1] "[PATCH 1/2] ARM: dts: renesas: Drop ethernet-phy-ieee802.3-c22 from PHY compatible string on all
>>>> RZ boards"
>>>>       https://lore.kernel.org/20240630034649.173229-1-marex@denx.de/
>>>> [2] "[PATCH 2/2] arm64: dts: renesas: Drop ethernet-phy-ieee802.3-c22 from PHY compatible string on
>>>> all RZ boards"
>>>>       https://lore.kernel.org/20240630034649.173229-2-marex@denx.de
>>>
>>> I haven't seen these patches.
>>
>> They are deprecated.
>>
>>> It does not cover all the SoCs/boards. If Marek want to take over, He can send next version
>>> covering all Renesas boards + binding change.
>> Isn't this series effectively exactly that ?
> 
> I believe we still have e.g. the KSZ8041 and KSZ9031 PHY nodes to fix,
> for both RZ and R-Car boards? Some of them were covered by [1] and
> [2] above.

I hope this is now all addressed by two board fixes [3] [4] and one 
larger fix [5]. But there are also other warnings on the arm32 side 
which are not related to ethernet schemas.

[3] 
https://lore.kernel.org/linux-arm-kernel/20260326045355.223529-1-marek.vasut+renesas@mailbox.org/
[4] 
https://lore.kernel.org/linux-arm-kernel/20260326045416.223556-1-marek.vasut+renesas@mailbox.org/
[5] 
https://lore.kernel.org/linux-arm-kernel/20260326045523.223620-1-marek.vasut+renesas@mailbox.org/

-- 
Best regards,
Marek Vasut
