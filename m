Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <fa6696c3-30d0-b7a4-de0b-9cecd485d5a5@arm.com>
References: <148897088333.16106.13237004440297956899.sendpatchset@little-apple>
 <148897094380.16106.17145886836361556040.sendpatchset@little-apple> <fa6696c3-30d0-b7a4-de0b-9cecd485d5a5@arm.com>
From: Magnus Damm <magnus.damm@gmail.com>
Date: Thu, 9 Mar 2017 12:57:15 +0900
Message-ID: <CANqRtoQOG=S7s=a+pauF5rU9r-Nch9rcSnvN9utp2ChoA1Trng@mail.gmail.com>
Subject: Re: [PATCH v3 06/09] iommu/ipmmu-vmsa: Write IMCTR twice
To: Robin Murphy <robin.murphy@arm.com>
Cc: joro <joro@8bytes.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        iommu@lists.linux-foundation.org,
        Simon Horman <horms+renesas@verge.net.au>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Robin,

On Wed, Mar 8, 2017 at 9:34 PM, Robin Murphy <robin.murphy@arm.com> wrote:
> On 08/03/17 11:02, Magnus Damm wrote:
>> From: Magnus Damm <damm+renesas@opensource.se>
>>
>> Write IMCTR both in the root device and the leaf node.
>>
>> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
>> ---
>>
>>  Changes since V2:
>>  - None
>>
>>  Changes since V1:
>>  - None
>>
>>  drivers/iommu/ipmmu-vmsa.c |   17 ++++++++++++++---
>>  1 file changed, 14 insertions(+), 3 deletions(-)
>>
>> --- 0018/drivers/iommu/ipmmu-vmsa.c
>> +++ work/drivers/iommu/ipmmu-vmsa.c   2017-03-08 18:30:36.870607110 +0900
>> @@ -286,6 +286,16 @@ static void ipmmu_ctx_write(struct ipmmu
>>       ipmmu_write(domain->root, domain->context_id * IM_CTX_SIZE + reg, data);
>>  }
>>
>> +static void ipmmu_ctx_write2(struct ipmmu_vmsa_domain *domain, unsigned int reg,
>> +                          u32 data)
>
> That's pretty cryptic. Maybe both functions could do with less ambiguous
> names - something like ipmmu_ctx_write_root() vs. ipmmu_ctx_write_all(),
> perhaps? (and if there's a more specific hardware term than "all" that
> describes this kind of configuration, even better).

Yeah I agree. Will fix in next version!

Thanks,

/ magnus
