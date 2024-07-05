Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2D114373B;
	Fri,  5 Jul 2024 21:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720216252; cv=none; b=Gw6n2BMvDCiiJ7dPY7qsi3CBbRoNE/J9lGZepW1IsnUDSXDecMHejSmDt5D8EFvaRsuYbtdMXLXYmzw4zo7d1GWzhIM+DedXiuj64phhbApC37i/qVJjPBPdVHqhHN5rr5weOsvHi6YU7KcIkGHlN0sIGGysQyd8d4q+qRxcRQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720216252; c=relaxed/simple;
	bh=KN2iATEw+AszbvsC0jz5GWgQ90FLWw4CiJ8TLyIciJk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cXs/wKVFgwRuVDHNtlts25YvosrBTJT6CR+BrlWfQiBwad2qqPa8FcX1W//smcI9nDfj9dQjTuBrTwGgUrPiFH+EhXrgjVqCaqqVCTUrFtD141OwM7f0VAoIMaBdqmyKYYiAaDJ1ilij9Kz6q9i55l2zcBTOFHu5eIcObZOgn8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=d5emkgGt; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="d5emkgGt"
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id E13118813F;
	Fri,  5 Jul 2024 23:50:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1720216241;
	bh=n5Gt/eIuZPMyRDdvjrphXCVAI9D5fUg9qibFUjmusak=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=d5emkgGt8WhVIal6n/LvyRIjquSYuHsWZm0YI0wzISgH8wFaxDikDd+OGGIW9KW5a
	 VclF0Rvr3pdek0kWSDr+hTkVYEye+jBkNx5kMzBMDZ4VGUI9Aa3xJrc1YYq9pgtICk
	 oz2+Y8Jhof8USt6FwK0gEcDN93aVjBCwJVAqqmZPw8uTwgdTPHD804qzURZThpufSz
	 ChWQdbVfz/1F7EUnkp4ntz4HH2oMxauCsNWLW1d82v4CbHJ0h4TbR+L3dd9ITxqX8x
	 K3UJ0jO5aXE6Fq4lVNLGF/7TXiR7VD8Hwp/yhzYfJow52A5cjWN/nr2BXWZ68IsiCt
	 9XgKnDJt+pLrw==
Message-ID: <fa6db116-50bb-488b-a48f-c34f918424a2@denx.de>
Date: Fri, 5 Jul 2024 23:49:56 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: renesas: Drop ethernet-phy-ieee802.3-c22
 from PHY compatible string on all RZ boards
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?=
 <niklas.soderlund+renesas@ragnatech.se>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-arm-kernel@lists.infradead.org, andrew@lunn.ch,
 kernel@dh-electronics.com, kernel test robot <lkp@intel.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Khuong Dinh <khuong@os.amperecomputing.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm
 <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20240630034649.173229-1-marex@denx.de>
 <20240630034649.173229-2-marex@denx.de>
 <CAMuHMdXb6nBHLeK1c4CwEUBE8osDyAC_+ohA+10W_mZdGtQufQ@mail.gmail.com>
 <9f1ae430-4cc4-4e2e-a52c-ca17f499bbba@denx.de>
 <CAMuHMdWLLAff5_ndAvH9PofTpibJdOau65wK+QekcwR26H2YoA@mail.gmail.com>
 <20240703093601.GA6493@ragnatech.se>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20240703093601.GA6493@ragnatech.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 7/3/24 11:36 AM, Niklas Söderlund wrote:
> On 2024-07-03 10:24:26 +0200, Geert Uytterhoeven wrote:
>> Niklas: commit 54bf0c27380b95a2 ("arm64: dts: renesas: r8a779g0: Use
>> MDIO node for all AVB devices") did keep the reset-gpios property in
>> the PHY node. I guess it should be moved one level up?
> 
> It's possible to have a rest-gpios property both in the mdio node and
> the phy node. The former resets the whole bus while the later a single
> PHY, at least that's my understanding.

My understanding of reset GPIO in the MDIO node is that it is used in 
case there might be multiple PHYs with shared reset GPIO on the same 
MDIO bus. Like on the NXP iMX28 .

> I think it would be more correct to move the reset-gpios up one level
> for r8a779g0. However as it already was in the PHY node and this
> functioned as it should I kept it there.
> 
> The need for the mdio node was to avoid a device specific property added
> in the BSP to reset the whole bus. At the moment I can't recall the two
> different call sites for when the two resets are called. Maybe if we
> move it to the mdio node we can avoid setting the PHY id in the
> compatible string as we could then always probe the PHY correctly. I
> will look into it
Thanks
