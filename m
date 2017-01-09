Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
Subject: Re: [PATCH] arm64: do not set dma masks that device connection can't
 handle
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Arnd Bergmann <arnd@arndb.de>
References: <9a03c05d-ad4c-0547-d1fe-01edb8b082d6@cogentembedded.com>
 <1483713911-2079-1-git-send-email-nikita.yoush@cogentembedded.com>
 <d60c54cd-ca62-4c56-7545-17e15f80b797@cogentembedded.com>
Cc: linux-arm-kernel@lists.infradead.org,
        Will Deacon <will.deacon@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms@verge.net.au>,
        Bjorn Helgaas <bhelgaas@google.com>,
        artemi.ivanov@cogentembedded.com
From: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Message-ID: <5c4736a6-4d0b-342e-2a5c-9aaaa933b138@cogentembedded.com>
Date: Mon, 9 Jan 2017 09:56:34 +0300
MIME-Version: 1.0
In-Reply-To: <d60c54cd-ca62-4c56-7545-17e15f80b797@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

>> +    if (mask > dev->archdata.parent_dma_mask)
>> +        mask = dev->archdata.parent_dma_mask;
>> +
>> +
> 
>    One empty line is enough...

Ok

>> +    /*
>> +     * Whatever the parent bus can set. A device must not set
>> +     * a DMA mask larger than this.
>> +     */
>> +    dev->archdata.parent_dma_mask = size;
> 
>    Not 'size - 1'?

Good question.

Indeed of_dma_configure() calls arch_setup_dma_ops() with size, not
mask. Which implies '-1' is needed here. Although better fix may be to
change caller side - to make DMA_BIT_MASK(64) case cleaner.

Will repost path.

Nikita
